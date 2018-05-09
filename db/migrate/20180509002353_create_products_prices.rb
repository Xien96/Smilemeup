class CreateProductsPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :products_prices do |t|
    	t.references :product, index: true
    	t.integer :price
    	t.timestamps null: false
    end
    add_foreign_key :products_prices, :products
  end
end
