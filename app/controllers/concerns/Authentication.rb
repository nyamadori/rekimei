concern :Authentication do
  included do
    def sign_in(s)
      session[:accounts] ||= {}
      session[:accounts][s.account.id] = true
    end
  end
end
