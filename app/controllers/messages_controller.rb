class MessagesController < ApplicationController
  respond_to :html, :js

  def index
    @messages = Message.all
    @new_message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      sync_new @message
    end

    respond_with { @message }
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
