# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Account, type: :model do
  describe '#update_password?' do
    let!(:account) { create(:account) }

    context 'when both of current_password and new_password are present' do
      it 'returns true' do
        account.current_password = 'password'
        account.new_password = 'password'

        expect(account.update_password?).to be_truthy
      end
    end

    context 'when either of current_password and new_password are present' do
      it 'returns true' do
        account.current_password = 'password'
        account.new_password = ''

        expect(account.update_password?).to be_truthy
      end

      it 'returns true' do
        account.current_password = ''
        account.new_password = 'password'

        expect(account.update_password?).to be_truthy
      end
    end

    context 'when current_password and new_password are not present' do
      it 'returns true' do
        account.current_password = ''
        account.new_password = ''

        expect(account.update_password?).to be_falsey
      end
    end
  end

  describe 'when sets current password and new password' do
    let!(:account) { create(:account) }

    it 'updates a password' do
      account.current_password = 'password'
      account.new_password = 'new password'

      expect do
        account.save
      end.to change(account, :password).from('password').to('new password')
    end

    context 'with invalid current password' do
      it 'has a validation error' do
        account.current_password = 'invalid'
        account.new_password = 'new password'
        account.validate

        expect(account.errors[:current_password]).to include('Invalid Password')
      end
    end
  end

  describe 'when does not set current password and new password' do
    let!(:account) { create(:account) }

    it 'does not update a password' do
      expect do
        account.update({})
      end.not_to change(account, :password) && change(account, :password_digest)
    end
  end
end
