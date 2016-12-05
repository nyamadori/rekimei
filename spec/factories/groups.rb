FactoryGirl.define do
  factory :group do
    name { FFaker::Company.name }
    slug { FFaker::Internet.slug }
  end
end
