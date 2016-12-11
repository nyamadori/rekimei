class AccountsController < ApplicationController
  def show
    @group = Group.find_by!(slug: group_slug)
    @member = @group.members.find(params[:member_id])
    @account = @member.account
  end

  private

  def account_params
    params.permit(:account).require(:email, :password)
  end
end
