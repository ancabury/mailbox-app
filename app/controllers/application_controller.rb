class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
  end

  def authorization_error
    redirect_to root_path, flash: { error: 'Unauthorized action' }
  end

  def mailbox
    @mailbox ||= current_user.mailbox
  end
end
