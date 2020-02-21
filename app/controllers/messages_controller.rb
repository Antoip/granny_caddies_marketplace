class MessagesController < ApplicationController
  def conversations
    @users_with_conversation = current_user.friends
  end

  def index
    @messages = current_user.conversation_with(params[:user_id])
    @messages.each do |message|
      message.read = true
      message.update({read: message.read})
    end
    raise
    @message  = Message.new
    @friend   = User.find(params[:user_id])
  end

  def create
    @message          = Message.new(message_params)
    @message.sender   = current_user
    @message.receiver = User.find(params[:user_id])
    @id = params[:user_id]
    # if @message.save
    #   redirect_to dashboard_path
    # else
    #   @friend   = User.find(params[:user_id])
    #   @messages = current_user.conversation_with(params[:user_id])
    #   render :index
    # end

    if @message.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'caddies/index' }
        format.js  # <-- idem
      end
    end
  end

  def update
    @message = Message.find(params[:id])
    # @caddie = Caddie.find(params[:id])
    @message.read = true
    @message.update({read: @message.read})
    redirect_to dashboard_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
