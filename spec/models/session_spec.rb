require 'rails_helper'

RSpec.describe Session, type: :model do
  describe '#authenticate' do
    let!(:account) { create(:account) }
    let!(:group) { create(:group) }

    before do
      group.accounts << account
      group.save
    end

    context 'with a valid session' do
      let(:session) do
        Session.new(
          email: account.email,
          password: account.password,
          group_slug: group.slug
        )
      end

      it 'has no validation error' do
        expect(session.valid?).to be_truthy
      end
    end

    context 'with a invalid password' do
      let(:session) do
        Session.new(
          email: account.email,
          password: 'invalid',
          group_slug: group.slug
        )
      end

      it 'has a validation error' do
        session.validate
        expect(session.errors[:base]).to include('Invalid Email or Password')
      end
    end

    context 'with a invalid group slug' do
      let(:session) do
        Session.new(
          email: account.email,
          password: account.password,
          group_slug: 'invalid'
        )
      end

      it 'has a validation error' do
        session.validate
        expect(session.errors[:base]).to include('No group for invalid')
      end
    end

    context 'with no account in the group' do
      let(:session) do
        Session.new(
          email: 'invalid',
          password: account.password,
          group_slug: group.slug
        )
      end

      it 'has a validation error' do
        session.validate
        expect(session.errors[:base]).to include('Invalid Email or Password')
      end
    end
  end
end
