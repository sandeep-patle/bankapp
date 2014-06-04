class AdminDashboardController < ApplicationController

  before_filter:authenticate_admin

  def index
  end

  def offer_fund
  	@users_array = User.all.map { |user| ["#{user.first_name} #{user.last_name} - #{user.account.account_number}", user.account.id] if user.role != "admin" }
  end

  def transfer_fund
    if AccountTransaction.transfer_amount(params[:account_transaction])
      flash[:notice] = "Fund successfully transfered."
      render :offer_fund
    else
      flash[:error] = "Unable to transfer the fund"
      render :offer_fund
    end  	
  end

end
