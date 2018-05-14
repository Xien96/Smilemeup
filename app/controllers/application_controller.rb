class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_lang, :set_currency_country
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :city, :country, :avatar, :avatar_cache, :remove_avatar])
    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :phone, :city, :country, :email, :password,
    #                                                                   :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
    @active = "account"
  end

  def page_not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def set_lang
    @lang = (params[:lang] || current_user.try(:locale) || session[:lang] ||  "en")
    I18n.locale = @lang
    current_user.update_column(:locale, @lang) if @lang.present? and current_user.present?
    session[:lang] = @lang
    session[:cart] ||= []
  end

  def set_currency_country
    @currency = (params[:currency] || current_user.try(:currency) || session[:currency] || "usd")
    @country = (params[:country] || current_user.try(:country) || session[:country] || "uk")
    session[:currency] = @currency
    session[:country] = @country
    if current_user.present?
      if @currency.present?
        current_user.update_column(:currency, @currency)
      end
      if @country.present?
        current_user.update_column(:country, @country)

      end
    end
  end
end
