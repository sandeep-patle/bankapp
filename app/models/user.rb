class User < ActiveRecord::Base
  attr_accessible :city, :first_name, :last_name, :mobile_number

  has_one :account, :dependent => :destroy
end
