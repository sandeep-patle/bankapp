class AdminDashboardController < ApplicationController

  before_filter:authenticate_admin

  def index
  end

  def fund_transfer
  end
end
