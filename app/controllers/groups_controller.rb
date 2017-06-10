class GroupsController < ApplicationController
before_action :set_group,only:[:show,:edit,:update]

  def index
    if user_signed_in?
      @groups = current_user.groups
      @group = Group.find(params[:group_id]) if params[:group_id]
    else
      redirect_to new_user_session_path
    end
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "グループを作成しました"
      redirect_to root_path
    else
      flash[:alert] = "グループの作成に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:notice] = "グループを更新しました"
      redirect_to root_path
    else
      flash[:alert] = "グループの更新に失敗しました"
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
