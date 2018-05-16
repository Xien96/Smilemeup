class OrdersController < ApplicationController
  def my_orders
    @orders = current_user.user_products
  end

end

