class Group < ApplicationRecord
  has_many :accounts

  validates :slug, presence: true
  validates :name, presence: true
end
