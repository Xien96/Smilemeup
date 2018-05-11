class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :creator_id
      t.integer :target_id

      t.timestamps null:false
    end
  end
end
