class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    if @session.valid?
      sign_in(@session)
      redirect_to group_path(current_group.slug)
    else
      render :new
    end
  end

  def destroy
    sign_out(current_session)

    if current_group
      redirect_to group_path(current_group.slug)
    else
      redirect_to new_session_path
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :group_slug)
  end
end
