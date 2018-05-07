class CartController < ApplicationController
    before_action :authenticate_user! , only: [:cart , :index]
  def index
    @cart = session[:cart]
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
  
  def create_user_product
    products = session[:cart].map{|x| x["product"]}
    products_id = Product.where(:name => products).collect { |p| "#{p[:id]}"}
    # products_id = Product.find_by(:name => products).id
    styles = session[:cart].map{|x| x["style"]}
    styles_id = Style.where(:name => styles).collect { |p| "#{p[:id]}"}
    if products_id.size > 1
      products_id.zip(styles_id).each{|b| @transaction = UserProduct.create(:user_id => current_user.id , :product_id => b[0] , :style_id => b[1])}
    else
      styles_id.each do |y|
            @transaction = UserProduct.create(:user_id => current_user.id , :product_id => products_id[0] , :style_id => y)
      end
    end
    session[:cart] = nil
    redirect_to  products_path
  end
  
  def cart
    @total_cost = index
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.sources.create(source: params[:stripeToken])
    charge = Stripe::Charge.create(
      :customer    => customer,
      :amount      => @total_cost*100,
      :currency    => 'usd'
    )
    if charge["paid"]
      create_user_product 
      # flash[:notice] = 'Card charged successfully.'
    else
      # rescue Stripe::CardError => e
      #   flash[:error] = e
      redirect_to  products_checkout_path
    end

  end

end
