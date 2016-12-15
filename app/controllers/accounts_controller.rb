# frozen_string_literal: true
class AccountsController < ApplicationController
  before_action :member, :account

  def update
    if account.update(account_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def member
    @member ||= current_group.members.find(params[:member_id])
  end

  def account
    @account ||= member.account
  end

  def account_params
    params.require(:account).permit(:email, :current_password, :new_password)
  end
end
