class Group < ApplicationRecord
  has_many :accounts, through: :members
  has_many :members

  validates :slug, presence: true
  validates :name, presence: true
end
