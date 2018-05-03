class CartController < ApplicationController
  def index
    @cart = session[:cart]
    puts "=============================="
    puts @cart
    @total = 0
    @cart.each do |ci|
      price = Product.find_by(name: ci['product']).price
      quantity = ci['quantity'].to_i
      @total += (price * quantity)
    end
    @total /= 100
    @active = "cart"
  end

  def add
    previous_quantity = 0
    cart = session[:cart]
    previous = session[:cart]
    previous = previous.select {|ci| ci['product'] == params[:product]}
    previous = previous.select {|ci| ci['style'] == params[:style]}
    if previous.count == 1
      previous_quantity = previous[0]['quantity']
    end
    new_quantity = previous_quantity.to_i + params[:quantity].to_i
    cart = cart - previous
    item = {product: params[:product], style: params[:style], quantity: new_quantity}
    session[:cart] = cart + [item]
    render json: { message: "success", cart: session[:cart] }, :status => 200
  end
end
