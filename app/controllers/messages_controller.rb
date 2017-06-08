class MessagesController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.find(params[:group_id]) if params[:group_id]
    @message = Message.new

  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "メッセージを送信しました"
      redirect_to group_messages_path
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
      redirect_to group_messages_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id:current_user.id,group_id:params[:group_id])
  end

end
