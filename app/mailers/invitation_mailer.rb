class InvitationMailer < ApplicationMailer
  def send_invitation(invitation)
    @invitation = invitation
    mail(
      to: invitation.account.email,
      subject: "Welcome to #{invitation.group.name}"
    )
  end
end
