class AccountTransactions < ActiveRecord::Base
  attr_accessible :amount, :sender_id, :receiver_id, :transaction_type, :depositer

  belongs_to :sender, :class_name => "Account"
  belongs_to :receiver, :class_name => "Account"

  # attributes is a hash like
  # { :amount => 100, :sender_id => 10011, :receiver_id => 1102, :transaction_type => "NEFT" } OR
  # { :amount => 100, :receiver_id => 1102, :transaction_type => "OFFER", :depositer => "admin" }
  def transfer_amount(attributes)
    return false unless validate_transaction(attributes)

  	receiver = Account.find_by_account_number(attributes[:receiver_id])
  	return false if receiver.blank?

  	if attributes[:transaction_type] == "NEFT"
  		sender = Account.find_by_account_number(attributes[:sender_id])
  		return false if sender.blank?
  		if sender.debit_amount(attributes[:amount])
  			receiver.credit_amount(attributes[:amount])
        self.create(attributes)
  		else
  			return false
  		end
  	else
      receiver.credit_amount(attributes[:amount])
      self.create(attributes)
  	end
  end

  def validate_transaction(attributes)
    return false if attributes[:receiver_id].blank? || attributes[:amount].blank? || attributes[:amount] < 1
    return false if attributes[:transaction_type] == "NEFT" && attributes[:sender_id].blank? &&  attributes[:sender_id] == attributes[:receiver_id]
    return false if attributes[:transaction_type] != "NEFT" && attributes[:depositer] != "admin"
  end
end
