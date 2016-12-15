# Preview all emails at http://localhost:3000/rails/mailers/invitation
class InvitationPreview < ActionMailer::Preview
  def send_invitation
    invitation = FactoryGirl.build(:invitation)

    InvitationMailer.send_invitation(invitation)
  end
end
