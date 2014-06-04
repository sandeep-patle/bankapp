class ApplicationController < ActionController::Base
  
  protect_from_forgery

  def set_user_session(user)
  	if user.present?
  		session[:user_id] = user.user_id
      session[:role] = user.role
  		session[:logged_in_time] = Time.now.utc
  	end
  end

  def authenticate_admin
  	if session[:user_id].blank? || !session[:role].eql?("admin")
      redirect_to welcome_index_path 
    else
      @admin = User.find(:first, :conditions => [ "user_id = ? && role = ?", session[:user_id], session[:role]])
    end
  end

  # admin also able to access user section
  def authenticate_user  	
    if session[:user_id].blank?
      redirect_to welcome_index_path 
    else
      @user = User.find(:first, :conditions => [ "user_id = ?", session[:user_id]])
    end
  end

  def redirect_to_dashboard(role)
    if role == "admin"
      redirect_to admin_dashboard_index_path
    elsif role == "account_holder"
      redirect_to user_dashboard_index_path
    else
      redirect_to welcome_index_path
    end
  end

  def check_logged_in
    if !session[:user_id].blank? && session[:role].eql?("admin")
      redirect_to admin_dashboard_index_path 
    elsif !session[:user_id].blank? && session[:role].eql?("account_holder")
      redirect_to user_dashboard_index_path
    end 
  end
end
