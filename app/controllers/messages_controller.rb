class MessagesController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.find(params[:group_id]) if params[:group_id]
  end

end
