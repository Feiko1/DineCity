class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kind])
  end

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

  # before_action :authenticate_user!   #this is not necesary---we want people to be able ot use our website without signing up
end
