class Message < ApplicationRecord
  belongs_to :conversation, touch: true
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  validates_presence_of :body

  default_scope do
    order(updated_at: :asc)
  end


end
