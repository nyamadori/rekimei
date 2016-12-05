class Account < ApplicationRecord
  belongs_to :group

  validates :email, presence: true # TODO: Email のフォーマットバリデーション
end
