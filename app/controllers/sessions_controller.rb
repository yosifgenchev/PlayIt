class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def createFacebook
    #render text: request.env['omniauth.auth'].to_yaml
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroyFacebook
    session[:user_id] = nil
    redirect_to root_path
  end


end
