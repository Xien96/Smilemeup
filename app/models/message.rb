class Message < ApplicationRecord
  belongs_to :conversation, touch: true
  validates_presence_of :body

  default_scope do
    order(updated_at: :asc)
  end
end
