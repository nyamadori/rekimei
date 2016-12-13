class Account < ApplicationRecord
  attr_accessor :current_password, :new_password
  has_secure_password

  has_one :member
  has_one :group, through: :member
  has_one :profile, through: :member

  validates :email, presence: true # TODO: Email のフォーマットバリデーション
  validates :password, length: { minimum: 6 }, allow_nil: true

  with_options if: :update_password?, on: :update do |up|
    up.validate :valid_current_password?
    up.validates :new_password, length: { minimum: 6 }
  end

  before_update :update_password

  def update_password?
    current_password.present? && new_password.present?
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
