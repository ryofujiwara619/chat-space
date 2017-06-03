class UsersController < ApplicationController
before_action :set_user

  def edit
  end

  def update
    if current_user.id == @user.id
      if @user.update(user_params)
          redirect_to root_path
      else
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
