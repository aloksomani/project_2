class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  include SessionsHelper

  def authenticate
    redirect_to(login_path) if current_user.nil?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(home_path) unless @user == current_user
  end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
