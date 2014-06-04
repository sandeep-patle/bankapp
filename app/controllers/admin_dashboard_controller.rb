class AdminDashboardController < ApplicationController
  layout 'admin'

  before_filter:authenticate_admin

  def index
    @users = User.where(:role => "account_holder")
  end

  def offer_fund
  	@users_array = []
    User.all.each do  |user| 
      @users_array.push(["#{user.first_name} #{user.last_name} - #{user.account.account_number}", user.account.id]) if user.role != "admin"
    end
  end

  # attributes { :amount => 100, :depositer => "admin", :receiver_id => 1102, :transaction_type => "OFFER" }
  def transfer_fund
    params[:account_transaction][:amount] = params[:account_transaction][:amount].to_f
    account_transaction = AccountTransaction.new(params[:account_transaction])
    if account_transaction.transfer_amount
      flash[:notice] = "Fund successfully transfered."
      redirect_to admin_dashboard_offer_fund_path
    else
      flash[:error] = "Unable to transfer the fund."
      redirect_to admin_dashboard_offer_fund_path
    end  	
  end

end
