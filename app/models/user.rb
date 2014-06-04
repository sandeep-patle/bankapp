class User < ActiveRecord::Base
  attr_accessible :city, :first_name, :last_name, :mobile_number, :user_id, :password, :role

  has_one :account, :dependent => :destroy
    	
end
