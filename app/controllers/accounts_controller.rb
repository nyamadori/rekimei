class AccountsController < ApplicationController
  def new
    @account = Account.new(account_params)
  end

  def create
  end

  private

  def account_params
    params.permit(:account).require(:email, :password)
  end
end
