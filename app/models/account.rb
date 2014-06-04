class Account < ActiveRecord::Base
  attr_accessible :account_number, :balance, :user_id

  belongs_to :user

  has_many :send_transactions, :foreign_key => "sender_id", :class_name => "AccountTransaction"
  has_many :receive_transactions, :foreign_key => "receiver_id", :class_name => "AccountTransaction"

  def credit_amount(amount)
  	self.balance = self.balance + amount
  	self.save!
  end

  def debit_amount(amount)
  	return false if self.balance < amount
  	self.balance = self.balance - amount
  	self.save!
  end

end
