class AccountTransaction < ActiveRecord::Base
  attr_accessible :amount, :sender_id, :receiver_id, :transaction_type, :depositer

  belongs_to :sender, :class_name => "Account"
  belongs_to :receiver, :class_name => "Account"

  
  def transfer_amount
    return false unless validate_transaction

  	receiver = Account.find(self.receiver_id)

  	return false if receiver.blank?

  	if self.transaction_type == "NEFT"
  		sender = Account.find(self.sender_id)
      
  		return false if sender.blank?
  		if sender.debit_amount(self.amount)
  			receiver.credit_amount(self.amount)
        self.save!
  		else
  			return false
  		end
  	else
      receiver.credit_amount(self.amount)
      self.save!
  	end
  end

  def validate_transaction
    return false if self.receiver_id.blank? || self.amount.blank? || self.amount.to_f < 1
    return false if self.transaction_type == "NEFT" && self.sender_id.blank? &&  self.sender_id == self.receiver_id
    return false if self.transaction_type != "NEFT" && self.depositer != "admin"
    return true
  end
end
