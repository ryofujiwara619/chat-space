class GroupsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end
end
