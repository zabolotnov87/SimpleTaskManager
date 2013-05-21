module AuthHelper
	
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    current_user
  end
end