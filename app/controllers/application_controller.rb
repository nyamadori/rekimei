class ApplicationController < ActionController::Base
  include Authentication

  protect_from_forgery with: :exception
  before_action :authenticate!

  protected

  def group_slug
    params[:slug] || params[:group_slug]
  end
end
