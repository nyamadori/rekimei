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

      it 'returns true' do
        expect(session.authenticate).to be_truthy
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

      it 'returns true' do
        expect(session.authenticate).to be_falsy
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

      it 'returns true' do
        expect(session.authenticate).to be_falsy
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

      it 'returns true' do
        expect(session.authenticate).to be_falsy
      end
    end
  end
end
