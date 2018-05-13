class DashboardController < ApplicationController
  layout "dashboard"
  def index
  end

  def inbox
  end

  def orders
    @orders = current_user.user_products
  end

  def users
  end

  def settings
  end
end
