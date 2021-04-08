class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_session
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :first_name, :last_name, :postal_code, :address, :city, :province_id, :password, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :postal_code, :address, :city, :province_id, :password, :current_password])
  end

  private

  def initialize_session
    session[:cart] ||= []
  end

  def cart
    Product.find(session[:cart])
  end
end
