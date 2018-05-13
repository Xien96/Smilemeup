class AddQuantityAndSubtotalToUserProducts < ActiveRecord::Migration[5.1]
  def change
  	add_column :user_products, :quantity, :integer
  	add_column :user_products, :subtotal, :integer
  end
end
