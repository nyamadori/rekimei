# frozen_string_literal: true
FactoryGirl.define do
  factory :account do
    email { FFaker::Internet.email }
    password 'password'
    group
  end
end
