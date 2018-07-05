class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :user_signed_in?

  def user_signed_in?
    session[:access_token]
  end

  def current_user
    User.find(session[:user_id])
  end

  def authenticate_user!
    return redirect_to '/login' unless user_signed_in?
  end
end
