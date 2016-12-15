# frozen_string_literal: true
class MembersController < ApplicationController
  before_action :member, only: [:edit, :show, :destroy, :update]

  def index
    @members = current_group.members
  end

  def new
    @member = Member.new
    @member.build_profile
  end

  def create
    @member = current_group.members.build(member_params)

    if @member.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    if member.update(member_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    member.destroy
    redirect_to action: :index
  end

  private

  def member
    @member ||= Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(
      profile_attributes: [:id, :first_name, :last_name, :school_id]
    )
  end
end
