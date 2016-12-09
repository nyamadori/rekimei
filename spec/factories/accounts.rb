FactoryGirl.define do
  factory :account do
    email { FFaker::Internet.email }
    password 'password'
  end
end
