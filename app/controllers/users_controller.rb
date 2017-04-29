class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :show, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
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
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if logged_in?
      log_out
      flash[:danger] = "User and all events created by this user have been deleted."
      redirect_to users_path
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

  # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:danger] = "You can only edit your own account!"
        redirect_to root_path
      end
    end
    
    def require_admin
      if logged_in? && !current_user.admin?
        flash[:danger] = "Only admin users can perform that action"
        redirect_to root_path
      end
    end
end
