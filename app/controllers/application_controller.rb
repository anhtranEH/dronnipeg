class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_session
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :cart, :cart_size

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email first_name last_name postal_code address city
                                               province_id password email])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email first_name last_name postal_code address city
                                               province_id password current_password])
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def cart
    Product.where(id: session[:cart].keys)
  end

  def cart_size
    return 0 if cart.empty?

    cart.inject(0) { |sum, item| sum + session[:cart][item.id.to_s] }
  end
end
