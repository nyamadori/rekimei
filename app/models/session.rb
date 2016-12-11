class Session
  include ActiveModel::Model

  attr_accessor :email, :password, :group_slug, :group, :account

  validates :email, presence: true, if: -> { !authenticated? }
  validates :password, presence: true, if: -> { !authenticated? }
  validates :group_slug, presence: true, if: -> { !authenticated? }

  def authenticate
    @group = Group.find_by(slug: group_slug)

    if @group
      @account = @group.accounts.find_by(email: email)
      return true if @account&.authenticate(password)
    end

    false
  end

  def authenticated?
    !!(group && account)
  end
end
