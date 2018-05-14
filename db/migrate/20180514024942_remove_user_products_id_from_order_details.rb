class RemoveUserProductsIdFromOrderDetails < ActiveRecord::Migration[5.1]
  def change
  	remove_column :order_details, :user_product_id
  end
end
