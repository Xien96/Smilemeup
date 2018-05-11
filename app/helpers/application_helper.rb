module ApplicationHelper

  def build_conversation(conv)
    c = conv || Conversation.new
    c.messages.new
    c
  end
end
