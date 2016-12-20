class Invitation
  include ActiveModel::Model
  attr_accessor :group, :account, :profile, :inviter
  attr_accessor :account_attributes, :profile_attributes
  alias_attribute :invitee, :account

  validates :group, presence: true
  validate :validate_models

  def save
    group.save if valid?
  end

  def account
    @account ||= group.accounts.build(account_attributes)
  end

  def profile
    @profile ||= account.build_profile(profile_attributes)
  end

  private

  def validate_models
    errors.add(:account, :invalid) if account.invalid?
    errors.add(:profile, :invalid) if profile.invalid?
  end
end
