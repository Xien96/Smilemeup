class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.belongs_to :conversation
      t.timestamps null:false
    end
  end
end
