class Group < ApplicationRecord
  has_many :accounts, through: :members
  has_many :members

  validates :slug, presence: true
  validates :name, presence: true

  def to_param
    slug
  end

  def authenticate(account)
    accounts.exists?(account&.id)
  end
end
