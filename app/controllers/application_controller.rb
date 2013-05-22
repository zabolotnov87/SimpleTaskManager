class ApplicationController < ActionController::Base
  
  include AuthHelper

  helper_method :current_user
  
  before_filter :require_login
end
