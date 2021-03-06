class MessagesController < ApplicationController
before_action :set_instance_variables,only: [:index,:create]

  def index
    @message = Message.new
    @messages = @group.messages
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      # redirect_to group_messages_path, notice: "メッセージを送信しました"
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージを送信しました" }
        format.json
      end
    else
      flash.now[:alert] = "メッセージ送信に失敗しました。"
      render "index"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_instance_variables
      @groups = current_user.groups
      @group = Group.find(params[:group_id])
  end

end
