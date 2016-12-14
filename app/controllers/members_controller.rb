class MembersController < ApplicationController
  def index
    @members = current_group.members
  end
end
