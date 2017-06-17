class UsersController < ApplicationController
before_action :set_user, only:[:update]
before_action :authenticate_user!

  def index
    @user = User.where("name LIKE(?)", "%#{params[:keyword]}%")
      render json: @user
  end


  def update
    if @user.update(user_params)
       redirect_to root_path
       flash[:notice] = "アカウント情報を変更しました"
    else
       flash[:alert] = "アカウント更新に失敗しました。"
       render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
