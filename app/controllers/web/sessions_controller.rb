class Web::SessionsController < Web::ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:signin][:email])
    if user && user.authenticate(params[:signin][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "You are successfully logged as #{user.email}"
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
