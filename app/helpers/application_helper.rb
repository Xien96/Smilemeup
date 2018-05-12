module ApplicationHelper

  def build_conversation(conv)
    c = conv || Conversation.new
    c.messages.new(creator_id: current_user.try(:id))
    c
  end
end
