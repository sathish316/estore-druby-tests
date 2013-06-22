class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    session[:user_id] ||= "guest#{rand(1000)}"
    User.find_or_create_by_username(session[:user_id])
  end
end
