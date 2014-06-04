class AlterUserAndTransactionTables < ActiveRecord::Migration
  def up
  	add_column :users, :user_id, :string
  	add_column :users, :password, :string
  	add_column :users, :role, :string, default: 'account_holder'
  	add_column :account_transactions, :transaction_type, :string
  	add_column :account_transactions, :depositer, :string
  end

  def down
  	remove_column :users, :user_id
  	remove_column :users, :password
  	remove_column :users, :role
  	remove_column :account_transactions, :transaction_type
  	remove_column :account_transactions, :depositer
  end
end
