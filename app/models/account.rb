class Account < ApplicationRecord
  has_secure_password
  has_one :member

  validates :email, presence: true # TODO: Email のフォーマットバリデーション
  validates :password, length: { minimum: 6 }
end
