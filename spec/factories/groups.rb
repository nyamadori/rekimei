# frozen_string_literal: true
FactoryGirl.define do
  factory :group do
    name { FFaker::Company.name }
    slug { FFaker::Internet.slug }

    trait :with_accounts do
      after(:build) do |g|
        g.accounts.build(attributes_for(:account))
        g.accounts.build(attributes_for(:account))
        g.accounts.build(attributes_for(:account))
      end
    end
  end
end
