class Account < ApplicationRecord
  has_secure_password
  has_one :member

  validates :email, presence: true # TODO: Email のフォーマットバリデーション
end
