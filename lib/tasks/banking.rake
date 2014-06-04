namespace :banking do
  desc "Offer fund to an user"
  task :offer_fund,  [:user_id, :amount]  => :environment do |task, args|
  	if (args[:user_id].blank? || args[:amount].blank? || args[:amount] < 1)
      puts "Invalid arguments."
    else
      user = user.find_by_user_id(args[:user_id])
      if user.blank?
        puts "Invalid user id."
        return false
      else
        attributes = { :amount => args[:amount], :depositer => "admin", :receiver_id => user.account.id, :transaction_type => "OFFER" }
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
