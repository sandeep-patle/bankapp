class AccountsController < ApplicationController
  layout 'admin'

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])
    #@account_transactions =  @account.
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

end
