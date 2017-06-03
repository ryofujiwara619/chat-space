class UsersController < ApplicationController
before_action :set_params

  def edit
  end

  def update
    if current_user.id == @user.id
      @user.update(user_params)
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end

  def set_params
    @user = User.find(params[:id])
  end
end
