FactoryGirl.define do
  factory :group do
    name { FFaker::Company.name }
    slug { FFaker::Internet.slug }

    trait :with_accounts do
      after(:build) do |g|
        g.members.build(account: build(:account))
        g.members.build(account: build(:account))
        g.members.build(account: build(:account))
      end
    end
  end
end
