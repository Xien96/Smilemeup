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
    @active = "products"
    @up = Product.find_by(name: 'snap_up')
    @down = Product.find_by(name: 'snap_down')
    @both = Product.find_by(name: 'snap_both')
  end
end
