class Conversation < ApplicationRecord
  has_many :messages
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :target, class_name: 'User', foreign_key: :target_id

  accepts_nested_attributes_for :messages, allow_destroy: true
  default_scope do
    order(updated_at: :desc)
  end

  class << self
    def mine(user)
      self.includes(:messages).where(creator: user)
        .or(self.includes(:messages).where(target: user))
    end
  end

end
