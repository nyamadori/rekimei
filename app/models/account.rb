# frozen_string_literal: true
class Account < ApplicationRecord
  has_secure_password validations: false
  attr_accessor :current_password, :new_password

  belongs_to :group, inverse_of: :accounts
  has_one :profile, inverse_of: :account, dependent: :destroy
  accepts_nested_attributes_for :profile

  # TODO: Email のフォーマットバリデーション
  validates :email, presence: true, uniqueness: { scope: :group_id }
  validates :password, length: { minimum: 6 }, allow_nil: true

  with_options if: :update_password?, on: :update do |up|
    up.validate :valid_current_password?
    up.validates :new_password, length: { minimum: 6 }
  end

  before_update :update_password, if: :update_password?

  def update_password?
    [current_password, new_password].any?(&:present?)
  end

  private

  def valid_current_password?
    return if authenticate(current_password)

    errors.add(
      :current_password,
      :invalid_current_password,
      message: 'Invalid Password'
    )
  end

  def update_password
    self.password = new_password
  end
end
