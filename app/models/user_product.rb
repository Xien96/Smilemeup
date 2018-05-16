class UserProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
	belongs_to :style , optional: true
  belongs_to :order_detail


  def price(current_currency)
    product.product_prices.where(currency: current_currency).first.try(:price)
  end
end
