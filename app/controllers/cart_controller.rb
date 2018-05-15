require 'paypal-sdk-rest'
include PayPal::SDK::REST
include PayPal::SDK::Core::Logging

class CartController < ApplicationController
    before_action :authenticate_user! , only: [:cart , :index]
    skip_before_action :verify_authenticity_token
  def index
    if current_user.nil?
      @currency = 'usd'
    else
      @currency = current_user.currency
    end
    @cart = session[:cart]
    @total = 0
    @cart.each do |ci|
      price = Product.find_by(name: ci['product']).product_prices.find_by(:currency => @currency).price
      quantity = ci['quantity'].to_i
      @total += (price * quantity)
    end
    @active = "cart"
    session[:total] = @total
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
    if current_user.nil?
      @currency = 'usd'
    else
      @currency = current_user.currency
    end
    @order = OrderDetail.create(:first_name => session[:first_name] , :last_name => session[:last_name] , :zip_code => session[:zip_code] , :city => session[:city], :country => session[:country] , :additional_information => session[:additional_information] , :phone_number => session[:phone_number])
    session[:cart].each do |y|
      @transaction = UserProduct.create(
        :user_id => current_user.id,
        :product_id => Product.find_by(:name => y["product"]).id ,
        :style_id => Style.find_by(:name => y["style"]).id,
        :quantity => y["quantity"],
        :subtotal => y["quantity"]*Product.find_by(:name => y["product"]).product_prices.find_by(:currency => @currency).price , :order_detail_id => @order.id)
    end
    session[:cart] = nil
    session[:total] = nil
    session[:first_name] = nil
    session[:last_name] = nil
    session[:zip_code] = nil
    session[:city] = nil
    session[:country] = nil
    session[:additional_information] = nil
    session[:phone_number] = nil
    # redirect_to  products_path
  end
  
  def cart
    @total_cost = session[:total]
    customer = Stripe::Customer.retrieve(current_user.stripe_id)
    customer.sources.create(source: params[:stripeToken])
    charge = Stripe::Charge.create(
      :customer    => customer,
      :amount      => @total_cost*100,
      :currency    => current_user.currency
    )
    if charge["paid"]
      create_user_product
      redirect_to  products_path 
      # flash[:notice] = 'Card charged successfully.'
    else
      # rescue Stripe::CardError => e
      #   flash[:error] = e
      redirect_to  products_checkout_path
    end

  end

 def checkout
    @total_cost = session[:total]
    @payment = Payment.new({
      :intent =>  "sale",

      # ###Payer
      # A resource representing a Payer that funds a payment
      # Payment Method as 'paypal'
      :payer =>  {
        :payment_method =>  "paypal" },

      # ###Redirect URLs
      :redirect_urls => {
        :return_url => "#{request.base_url}/execute",
        :cancel_url => "#{request.base_url}/" },

      # ###Transaction
      # A transaction defines the contract of a
      # payment - what is the payment for and who
      # is fulfilling it.
      :transactions =>  [{

        # Item List
        # :item_list => {
        #   :items => [{
        #     :name => "item",
        #     :sku => "item",
        #     :price => "5",
        #     :currency => "USD",
        #     :quantity => 1 }]},

        # ###Amount
        # Let's you specify a payment amount.
        :amount =>  {
          :total =>  @total_cost ,
          :currency =>  current_user.currency.upcase },
        :description =>  "This is the payment transaction description." }]})
    # Create Payment and return status
    if @payment.create
      render json: {success: true, paymentID: @payment.id}
    else
      render json: {success: false}
    end
  end

  def execute
    payment = PayPal::SDK::REST::Payment.find(params[:paymentID])
    if payment.execute(payer_id: params[:payerID])
      create_user_product
      render json: {msg: 'Payment Complete'}
      # redirect_to  products_path(format: :json , msg: 'Payment Complete')
    else
      render json: {msg: payment.error}
    end
  end

  def remove_item
    session[:cart].delete_at(params[:index].to_i)
    redirect_to products_checkout_path 
  end
  def address
    session[:first_name] = params[:first_name]
    session[:last_name] = params[:last_name]
    session[:zip_code] = params[:zip_code]
    session[:city] = params[:city]
    session[:country] = params[:country]
    session[:additional_information] = params[:additional_information]
    session[:phone_number] = params[:phone_number]
    redirect_to products_checkout_path
  end
end
