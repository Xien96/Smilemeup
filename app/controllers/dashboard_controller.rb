class DashboardController < ApplicationController
  layout "dashboard"
  def index

  end

  def inbox
    @conversations  = Conversation.all
  end

  def orders
    @orders = current_user.user_products
  end

  def users
    @users = User.all
  end

  def settings
    @user = current_user
  end
end
