class UserDashboardController < ApplicationController
  layout 'user'
	
  before_filter:authenticate_user
  
  def index
    @account = @user.account
  end

  def fund_transfer
    @users_array = []
    User.all.each do  |user| 
      if (user.role != "admin" && user.id != @user.id )         
        @users_array.push(["#{user.first_name} #{user.last_name} - #{user.account.account_number}", user.account.id])
      end        
    end
  end

  # attributes { :amount => 100, :sender_id => 10011, :receiver_id => 1102, :transaction_type => "NEFT" }
  def transfer_fund
    params[:account_transaction][:amount] = params[:account_transaction][:amount].to_f
    account_transaction = AccountTransaction.new(params[:account_transaction])
    if account_transaction.transfer_amount
      flash[:notice] = "Fund successfully transfered."
      redirect_to user_dashboard_fund_transfer_path
    else
      flash[:error] = "Unable to transfer the fund"
      redirect_to user_dashboard_fund_transfer_path
    end   
  end
end
