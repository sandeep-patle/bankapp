class AdminDashboardController < ApplicationController

  before_filter:authenticate_admin

  def index
  end

  def offer_fund
  	@users_array = User.all.map { |user| ["#{user.first_name} #{user.last_name} - #{user.account.account_number}", user.id] if user.role != "admin" }
  end

  def transfer_fund
  	if (params[:user][:user_id].blank? || params[:user][:amount].blank? || params[:user][:amount] < 1 )
      flash[:error] = "Unable to offer fund"
  		render :offer_fund
  	else
      user = User.find(params[:user][:user_id])
      if user.present? && user.credit_amount(amount)
        flash[:notice] = "Fund successfully transfered."
        render :offer_fund
      else
        flash[:error] = "Unable to transfer the fund"
        render :offer_fund
      end
  	end
  end

end
