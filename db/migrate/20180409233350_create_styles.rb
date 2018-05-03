class CreateStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :styles do |t|
      t.string :name, unique: true, null: false
      t.string :tagline, null: false
      t.timestamps
    end
  end
end
