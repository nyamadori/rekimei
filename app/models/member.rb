class Member < ApplicationRecord
  belongs_to :account
  belongs_to :group
  has_one :profile
  accepts_nested_attributes_for :profile
end
