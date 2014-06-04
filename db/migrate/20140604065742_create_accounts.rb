class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :account_number
      t.decimal :balance
      t.integer :user_id

      t.timestamps
    end
  end
end
