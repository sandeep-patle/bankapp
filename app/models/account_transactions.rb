class AccountTransactions < ActiveRecord::Base
  attr_accessible :amount, :from_account_number, :to_account_number
end
