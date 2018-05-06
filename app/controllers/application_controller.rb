class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_lang, :set_currency_country
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
    @lang ||= (params[:lang] || current_user.try(:locale) || "en")
    I18n.locale = @lang
    current_user.update_column(:locale, @lang) if @lang.present? and current_user.present?
    session[:cart] ||= []
  end

  def set_currency_country
    @currency ||= (params[:currency] || current_user.try(:currency) || "usd")
    @country ||= (params[:country] || current_user.try(:country) || "uk")
    if current_user.present?
      if @currency.present?
        current_user.update_column(:currency, @currency)
      end
      if @country.present?
        current_user.update_column(:currency, @currency)

      end
    end
  end
end
