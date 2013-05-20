class Web::ApplicationController < ApplicationController
  protect_from_forgery

  before_filter :require_login

  helper_method :current_user

  private

  def require_login
    unless logged_in?
      redirect_to new_session_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
