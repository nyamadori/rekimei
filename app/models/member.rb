class Member < ApplicationRecord
  belongs_to :account, required: false, autosave: true
  belongs_to :group
  has_one :profile, inverse_of: :member, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :profile
end
