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
    conv.messages.map do |m|
      next if m.creator_id.present?
      m.creator_id = current_user.id
    end
    conv.save!
    redirect_back(fallback_location: '/')
  end

  def update
    @conv = Conversation.find(params[:id])
    @conv.assign_attributes(conversation_params)
    @conv.messages.map do |m|
      next if m.creator_id.present?
      m.creator_id = current_user.id
    end
    @conv.save
    redirect_back(fallback_location: '/')

  end

  def show
    @conv = Conversation.find(params[:id])
  end


  def conversation_params
    params.require(:conversation).permit([:id, :target_id, :creator_id, messages_attributes:[:id, :body, :_destroy]])
  end
end