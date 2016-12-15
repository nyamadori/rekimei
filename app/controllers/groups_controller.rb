# frozen_string_literal: true
class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.accounts.build
  end

  def create
    @group = Group.new(group_params)
    @session = Session.new(account: @group.accounts.first, group: @group)

    if @group.save
      sign_in(@session)
      redirect_to group_path(current_group.slug)
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(
      :slug, :name, accounts_attributes: [:email, :password]
    )
  end
end
