class Session
  include ActiveModel::Model

  attr_accessor :email, :password, :group_slug
  attr_reader :group, :account

  validates :email, presence: true
  validates :password, presence: true
  validates :group_slug, presence: true

  def authenticate
    @group = Group.find_by(slug: group_slug)

    if @group
      @account = @group.accounts.find_by(email: email)
      return true if @account&.authenticate(password)
    end

    false
  end
end
