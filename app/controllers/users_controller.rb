class UsersController < ApplicationController

  before_action :check_no_auth

  def index
    unless current_user
      redirect_to splash_path
    end
  end

  def splash

  end


  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.persisted?
      flash[:success] = "Thanks for signing up! Login below."
      redirect_to login_path
    else
      flash[:danger] = @user.errors.full_messages.uniq.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:name,:password)
  end

end
