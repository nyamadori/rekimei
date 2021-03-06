# frozen_string_literal: true
class Group < ApplicationRecord
  has_many :accounts, inverse_of: :group

  accepts_nested_attributes_for :accounts

  validates :slug, presence: true
  validates :name, presence: true

  def to_param
    slug
  end

  def member?(account)
    accounts.exists?(account.id)
  end
end
