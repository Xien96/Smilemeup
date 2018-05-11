class StaticController < ApplicationController
  def index
    @active = "home"
  end

  def show
    @products = Product.all
  end

  def about
    @active = "about"
  end

  def contact
    @active = "contact"
  end

  def products
    @active = "products"
  end

  def clearup
    @active = "products"
  end

  def snapup
    @active = "products"
  end

  def snapup_order
    if current_user.nil?
      @currency = 'usd'
    else
      @currency = current_user.currency
    end
    @active = "products"
    @up = Product.find_by(name: 'snap_up')
  end
end
