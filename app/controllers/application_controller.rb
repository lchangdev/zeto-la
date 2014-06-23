class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user.present?
  end

  def set_current_user(user)
    session[:user_id] = user.id
  end

  def authenticate!
    unless signed_in?
      flash[:notice] = 'You need to sign in if you want to do that.'
      redirect_to groups_path
    end
  end

  helper_method :current_user
  helper_method :signed_in?
  helper_method :authenticate!
end
