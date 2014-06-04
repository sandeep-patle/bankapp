class UserDashboardController < ApplicationController
	
  before_filter:authenticate_user
  
  def index
  end

  def fund_transfer
  	if (user.role != "admin" || user.id != @user.id) 
  		@users_array = User.all.map { |user| ["#{user.first_name} #{user.last_name} - #{user.account.account_number}", user.account.id] }
  	end
  end

  # attributes { :amount => 100, :sender_id => 10011, :receiver_id => 1102, :transaction_type => "NEFT" }
  def transfer_fund
    if AccountTransaction.transfer_amount(params[:account_transaction])
      flash[:notice] = "Fund successfully transfered."
      render :fund_transfer
    else
      flash[:error] = "Unable to transfer the fund"
      render :fund_transfer
    end   
  end
end
