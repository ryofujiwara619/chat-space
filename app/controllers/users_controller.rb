class UsersController < ApplicationController
before_action :set_user
before_action :authenticate_user!

  def edit
  end

  def update
    if @user.update(user_params)
       redirect_to root_path
    else
       render 'edit'
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
