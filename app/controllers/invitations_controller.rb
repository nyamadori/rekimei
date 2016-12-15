class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new(group: current_group)
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.group = current_group

    if @invitation.save
      InvitationMailer.send_invitation(@invitation).deliver_now
      redirect_to action: :new
    else
      render :new
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(
      account_attributes: [:email],
      profile_attributes: [:first_name, :last_name, :school_id]
    )
  end
end
