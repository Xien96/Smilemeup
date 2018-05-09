class AddCurrencyToProductsPrices < ActiveRecord::Migration[5.1]
  def change
  	add_column :products_prices, :currency, :string, default: 'usd'
  end
end
