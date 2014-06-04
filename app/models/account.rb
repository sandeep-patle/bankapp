class Account < ActiveRecord::Base
  attr_accessible :account_number, :balance, :user_id

  belongs_to :user
end
