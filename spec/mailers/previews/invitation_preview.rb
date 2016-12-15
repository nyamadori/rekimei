# Preview all emails at http://localhost:3000/rails/mailers/invitation
class InvitationPreview < ActionMailer::Preview
  def send_invitation
    group = FactoryGirl.build(:group)
    account = FactoryGirl.build(:account)
    invitation = Invitation.new(group: group, account: account)

    InvitationMailer.send_invitation(invitation)
  end
end
