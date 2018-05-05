class CreateUserProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_products do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.references :style, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_products, :users
    add_foreign_key :user_products, :products
	add_foreign_key :user_products, :styles
  end
end
