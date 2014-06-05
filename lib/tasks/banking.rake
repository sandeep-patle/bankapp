namespace :banking do
  desc "Offer fund to an user"

  task :offer_fund => :environment do
    user_id = ENV['user_id'].to_i
    amount = ENV['amount'].to_f
  	if (user_id.blank? || amount.blank? || amount < 1)
      puts "Invalid arguments."
    else
      user = User.find_by_user_id(user_id)
      if user.blank? || user.role.eql?("admin")
        puts "Invalid user id."
      else
        attributes = { :amount => amount, :depositer => "admin", :receiver_id => user.account.id, :transaction_type => "OFFER" }
        account_transaction = AccountTransaction.new(attributes)
        if account_transaction.transfer_amount
          puts "Fund successfully transfered."          
        else
          puts "Unable to transfer the fund."
        end 
      end
    end
  end

end
