concern :Authentication do
  included do
    def sign_in(s)
      session[:accounts] ||= {}
      session[:accounts][s.account.id] = true
    end

    def current_accounts
      session[:accounts].keys.map { |id| Account.find_by(id) }.compact
    end

    def current_groups
      current_accounts.map(&:member).map(&:group)
    end
  end
end
