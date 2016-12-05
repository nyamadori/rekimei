FactoryGirl.define do
  factory :account do
    email { FFaker::Internet.email }
    encrypted_password 'encrypted password'
    group
  end
end
