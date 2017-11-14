class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_device_type

  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :name, :username, :line1, :image, :password) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :name, :username, :line1, :image, :password, :current_password) }
	end

  private
  def set_device_type
    request.variant = :phone if browser.device.mobile?
    request.variant = :phone if browser.platform.android_app?
    request.variant = :phone if browser.platform.android?
    request.variant = :phone if browser.platform.android_webview?
    request.variant = :phone if browser.device.tablet?
    request.variant = :phone if browser.device.iphone?
  end

  def after_sign_in_path_for(resource)
    current_user
  end
end
