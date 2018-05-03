class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, unique: true, null: false
      t.integer :price

      t.timestamps
    end
  end
end
