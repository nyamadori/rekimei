# frozen_string_literal: true
class Session
  include ActiveModel::Model

  attr_accessor :email, :password, :group_slug, :group, :account

  with_options unless: :authenticated? do |auth|
    auth.validates :email, presence: true
    auth.validates :password, presence: true
    auth.validates :group_slug, presence: true
  end

  validate :authenticate, if: -> { errors.size.zero? }

  def authenticate
    @group = Group.find_by(slug: group_slug)

    if @group
      @account = @group.accounts.find_by(email: email)

      unless @account&.authenticate(password)
        errors.add(:base, :email_or_password_invalid, message: 'Invalid Email or Password')
      end
    else
      errors.add(:base, :no_group, message: "No group for #{group_slug}")
    end
  end

  def authenticated?
    !!(group && account)
  end
end
