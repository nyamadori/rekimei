class Account < ApplicationRecord
  has_secure_password
  has_one :member
  has_one :group, through: :member
  has_one :profile, through: :member

  validates :email, presence: true # TODO: Email のフォーマットバリデーション
  validates :password, length: { minimum: 6 }
end
