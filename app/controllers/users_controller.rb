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
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day)
  end
end  

end
