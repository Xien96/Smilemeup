class AddCreatorIdToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :creator_id, :integer
    add_index :messages, :creator_id
  end
end
