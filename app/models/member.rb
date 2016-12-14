class Member < ApplicationRecord
  belongs_to :account, required: false
  belongs_to :group
  has_one :profile, inverse_of: :member
  accepts_nested_attributes_for :profile
end
