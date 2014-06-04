class AddAdminRecordByDefault < ActiveRecord::Migration
  def up
  	admin_user = User.where(role: 'admin')
  	User.create(:first_name => "admin", :last_name => "", :user_id => "admin", :password => "admin", :role => "admin") if admin_user.blank?
  end

  def down
  	User.where(:role => 'admin').destroy_all
  end
end
