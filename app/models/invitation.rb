class Invitation
  include ActiveModel::Model
  attr_accessor :group, :member, :account, :profile
  attr_accessor :group, :account_attributes, :profile_attributes

  validates :group, presence: true
  validate :validate_relations

  def save
    return unless valid?

    @member = group.members.build(
      account: account, profile: profile
    )

    @member.save
  end

  def account
    @account ||= Account.new(account_attributes)
  end

  def profile
    @profile ||= Profile.new(profile_attributes)
  end

  def member
    @member ||= group.members.build(account: account, profile: profile)
  end

  private

  def validate_relations
    account.validate
    profile.validate

    errors[:account] << account.errors
    errors[:profile] << profile.errors
  end
end
