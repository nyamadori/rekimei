# frozen_string_literal: true
FactoryGirl.define do
  factory :profile do
    first_name { FFaker::NameJA.first_name }
    last_name { FFaker::NameJA.last_name }
    description 'hello'
    account
  end
end
