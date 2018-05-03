class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_lang
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
    @active = "account"
  end
  
  def page_not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private 
  def set_lang
    @lang ||= (params[:lang] || "en")    
    session[:cart] ||= []
  end
end
