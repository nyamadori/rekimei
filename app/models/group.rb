class Group < ApplicationRecord
  validates :slug, presence: true
  validates :name, presence: true
end
