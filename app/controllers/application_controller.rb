class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception, with: :error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  private

  def authenticate
    return if user_signed_in?
    redirect_to root_path, alert: 'ログインしてください'
  end

  def error404(*)
    render 'error404', status: 404, formats: [:html]
  end

  def error500(e)
    logger.error [e, *e.backtrace].join("\n")
    render 'error500', status: 500, formats: [:html]
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:username, :email, :password, :password_confirmation, :remember_me)
    }
    devise_parameter_sanitizer.for(:sign_in) { |u|
      u.permit(:login, :username, :email, :password, :remember_me)
    }
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:username, :email, :password, :password_confirmation, :current_password)
    }
  end
end
