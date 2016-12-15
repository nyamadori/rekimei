class Invitation
  include ActiveModel::Model
  attr_accessor :group, :member, :account, :profile
  attr_accessor :group, :account_attributes, :profile_attributes

  validates :group, presence: true
  validate :validate_models

  def save
    return unless valid?
    member.save
  end

  def account
    @account ||= member.build_account(account_attributes)
  end

  def profile
    @profile ||= member.build_profile(profile_attributes)
  end

  def member
    @member ||= group.members.build
  end

  private

  def validate_models
    errors.add(:account, :invalid) if account.invalid?
    errors.add(:profile, :invalid) if profile.invalid?
  end
end
