class AddOrderIdToUserProducts < ActiveRecord::Migration[5.1]
  def change
  	add_reference :user_products, :order_detail, index: true
  end
end
