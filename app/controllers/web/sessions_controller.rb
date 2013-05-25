class Web::SessionsController < Web::ApplicationController
  
  skip_before_filter :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:signin][:email])
    if user && user.authenticate(params[:signin][:password])
      sign_in user
      flash_success
      redirect_to root_url
    else
      flash_error
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
