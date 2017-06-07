class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.find(params[:id]) if params[:id]
  end

  def show
    @group = Group.find(params[:id])
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
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
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
    params.require(:group).permit(:name)
  end
end
