class InvitationMailer < ApplicationMailer
  def send_invitation(invitation)
    @invitation = invitation
    mail(
      to: invitation.account.email,
      subject: "【Rekimei】#{invitation.group.name} への招待"
    )
  end
end
