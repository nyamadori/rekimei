class Account < ApplicationRecord
  has_one :member

  validates :email, presence: true # TODO: Email のフォーマットバリデーション
end
