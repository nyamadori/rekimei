FactoryGirl.define do
  factory :member do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    group
  end
end
