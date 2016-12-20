# frozen_string_literal: true
class AccountsController < ApplicationController
  before_action :account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = current_group.accounts
  end

  def update
    if account.update(account_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def account
    @account ||= current_group.accounts.find(params[:id])
  end

  def account_params
    params.require(:account).permit(
      :email, :current_password, :new_password,
      profile_attributes: [:id, :first_name, :last_name, :school_id]
    )
  end
end
