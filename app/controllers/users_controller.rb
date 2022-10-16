class UsersController < ApplicationController
  def create
    @users = User.new(params.require(:user).permit(:username, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day))
    @user.save
    redirect_to users_path
  end

  def new
    @user = User.new
  end

  def show
  end
  
end
