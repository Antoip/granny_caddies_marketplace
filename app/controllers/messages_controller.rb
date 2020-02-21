class MessagesController < ApplicationController
  def conversations
    @users_with_conversation = current_user.friends
  end

  def index
    @messages = current_user.conversation_with(params[:user_id])
    if @messages.last.user_id == current_user.id
      @messages.each do |message|

      end
    end
    @message  = Message.new
    @friend   = User.find(params[:user_id])
  end

  def create
    @message          = Message.new(message_params)
    @message.sender   = current_user
    @message.receiver = User.find(params[:user_id])
    if @message.save
      redirect_to dashboard_path
    else
      @friend   = User.find(params[:user_id])
      @messages = current_user.conversation_with(params[:user_id])
      render :index
    end
  end

  # def update(message)
  #   msg = Message.find(message)

  # end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end