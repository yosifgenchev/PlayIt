class UsersController < ApplicationController
  def new
  	@user = User.new
    if logged_in?
        @picture = current_user.picture.url
        @userName = current_user.name

        @hasPicture = !@picture.nil?
     end
  end

  def show
  	@user = User.find(params[:id])
    if logged_in?
        @picture = current_user.picture.url
        @userName = current_user.name

        @hasPicture = !@picture.nil?
     end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to PlayIt!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
    if logged_in?
        @picture = current_user.picture.url
        @userName = current_user.name

        @hasPicture = !@picture.nil?
     end
  end

  def update
    if logged_in?
        @picture = current_user.picture.url
        @userName = current_user.name

        @hasPicture = !@picture.nil?
     end
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, 
  								 :email, 
  								 :password, 
  								 :password_confirmation,
                   :picture,
                   :oauth_token,
                   :oauth_expires_at,
                   :uid,
                   :provider)
  end
end
