FactoryGirl.define do
  factory :invitation do
    group { build(:group) }
    account { build(:account) }
    inviter { build(:account) }
  end
end
