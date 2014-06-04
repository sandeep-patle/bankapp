class WelcomeController < ApplicationController

  before_filter :check_logged_in, :except => [:logout]
  
  def index
  end

  def login
    if session[:user_id].present?
      flash[:error] = "You are already logged in from other session"
      redirect_to welcome_index_path
    else
    	if params[:user][:user_name].blank? || params[:user][:password].blank?
    		flash[:error] = "User name and password can't blank."
    		redirect_to welcome_index_path
    	else
        user = User.find(:first, :conditions => [ "user_id = ? && password = ?", params[:user][:user_name], params[:user][:password] ])
        if user.present?
          set_user_session(user)
          redirect_to_dashboard(user.role)
        else
          flash[:error] = "Invalid user name or password"
          redirect_to welcome_index_path
        end
    	end
    end
  end

  def logout
    session[:user_id] = ''
    session[:role] = ''
    session[:logged_in_time] = ''
    flash[:notice] = "User logout"
    redirect_to welcome_index_path
  end
end
