class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  def authenticate_user
    unless session[:user_id]
      redirect_to(:controller => 'sessions', :action => 'login')
      return false
    else
      # set current_user by the current user object
      @current_user = User.find session[:user_id]
      return true
    end
  end
end
