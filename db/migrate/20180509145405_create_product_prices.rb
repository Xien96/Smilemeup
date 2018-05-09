class CreateProductPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :product_prices do |t|
      t.references :product, index: true
      t.string :currency, default: 'usd'
      t.integer :price
      t.timestamps
    end
    add_foreign_key :product_prices, :products
  end
end
