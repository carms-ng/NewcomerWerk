class UsersController < ApplicationController
  def index
  end

  def show
    @user  = User.find(current_user[:id])
  end

  def update
    @user = User.find(current_user[:id])
    @user.update(user_params)
    redirect_to profile_path(@user)
  end

  private

  def user_params
    params.required(:user).permit(:first_name, :last_name, :photo, :description, :location)
  end
end
