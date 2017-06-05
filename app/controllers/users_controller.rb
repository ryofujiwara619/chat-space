class UsersController < ApplicationController
before_action :set_user
before_action :authenticate_user!

  def edit
  end

  def update
    if @user.update(user_params)
       redirect_to root_path,notice:"アカウント情報を変更しました"
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

  def authenticate_user!
  unless current_user
    alert:"ログインしてください"
  end
end
end
