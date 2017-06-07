class GroupsController < ApplicationController
  def index
    @groups = Group.all
    render "groups/index"
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
      flash[:alert] = "グループを作成に失敗しました"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
