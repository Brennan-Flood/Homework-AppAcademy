class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    @current_user = user
    session[:session_token] = @current_user.reset_session_token!
    @current_user.save
  end

  def logout_user!
    if logged_in?
    @current_user.reset_session_token!
    @current_user.save
    @current_user = nil
    session[:session_token] = nil
    end
  end

  def logged_in?
    !!current_user
  end

end
