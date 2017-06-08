class MessagesController < ApplicationController
before_action :group_params,only: [:index,:create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: "メッセージを送信しました"
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
      render "messages/index"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def group_params
    @groups = Group.all
    @group = Group.find(params[:group_id])
  end

end
