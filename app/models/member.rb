class Member < ApplicationRecord
  belongs_to :group

  validates :first_name, presence: true
  validates :last_name, presence: true
end
