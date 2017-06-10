class MessagesController < ApplicationController
before_action :set_instance_variables,only: [:index,:create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: "メッセージを送信しました"
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
      render "index"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_instance_variables
    if user_signed_in?
      @groups = current_user.groups
      @group = Group.find(params[:group_id])
    else
      redirect_to new_user_session_path
    end
  end

end
