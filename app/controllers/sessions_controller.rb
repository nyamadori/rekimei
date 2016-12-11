class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    session = Session.new(session_params)

    if session.valid? && session.authenticate
      sign_in(session)
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    sign_out(current_session)
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :group_slug)
  end
end
