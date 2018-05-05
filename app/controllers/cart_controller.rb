class CartController < ApplicationController
    before_action :authenticate_user! , only: [:cart , :index]
  def index
    byebug
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
    @total
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

  def cart
    @total_cost = index

    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.sources.create(source: params[:stripeToken])
    # customer.Stripe::Token.create(:source  => params[:stripeToken])
    charge = Stripe::Charge.create(
      :customer    => customer,
      :amount      => @total_cost*100,
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to  products_checkout_path
  end

end
