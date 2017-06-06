class GroupsController < ApplicationController
  def index
    @groups = Group.all
    render "groups/index"
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group=Group.new
  end

  def create
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end
end