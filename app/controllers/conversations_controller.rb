class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def inbox
    @conversations = Conversation.mine(current_user)
  end

  def create
    conv = Conversation.new(conversation_params)
    conv.creator = current_user
    conv.save!
    redirect_to :inbox
  end

  def update
    @conv = Conversation.find(params[:id])
    @conv.update_attributes(conversation_params)
    render :show
  end

  def show
    @conv = Conversation.find(params[:id])
  end


  def conversation_params
    params.require(:conversation).permit([:id, :target_id, :creator_id, messages_attributes:[:id, :body, :_destroy]])
  end
end