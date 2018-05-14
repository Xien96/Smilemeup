class AddOrderDetailsIdTOUserProducts < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :order_details, :user_products
  end
end
