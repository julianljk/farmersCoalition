class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #protect_from_forgery
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

  #This method for prevent user to access Signup & Login Page without logout
  def save_login_state
    if session[:user_id]
      @user = User.find(session[:user_id])
      redirect_to(@user)
            #redirect_to(:controller => 'sessions', :action => 'home')
      return false
    else
      return true
    end
  end
end
