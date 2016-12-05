class Member < ApplicationRecord
  belongs_to :account
  belongs_to :group
  has_one :profile
end
