class ApplicationController < ActionController::Base
  
  include AuthHelper

  helper_method :signed_in?, :current_user
  
  before_filter :require_login
end
