# frozen_string_literal: true
class Profile < ApplicationRecord
  belongs_to :member, inverse_of: :profile
end
