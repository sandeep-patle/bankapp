class WelcomeController < ApplicationController

  before_filter :checked_logged_in_status
  
  def index
  end

  def login
    if session[:user_id].present?
      flash[:error] = "You are already logged in from other session"
      render :index
    end

  	if params[:user_id].blank? || params[:password].blank?
  		flash[:error] = "User name and password can't blank."
  		render :index
  	else
      user = User.find(:first, :conditions => [ "user_id = ? && password = ?", params[:user_name], params[:password] ])
      if user.present?
        set_user_session
        redirect_to_dashboard(user.role)
      else
        flash[:error] = "Invalid user name or password"
        render :index
      end
  	end
  end

  def logout
    session[:user_id] = ''
    session[:role] = ''
    session[:logged_in_time] = ''
    redirect_to welcome_path
  end
end
