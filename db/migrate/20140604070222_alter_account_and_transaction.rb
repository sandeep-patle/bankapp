class AlterAccountAndTransaction < ActiveRecord::Migration
  def up
  	change_column :accounts, :balance, :decimal, precision: 5, scale: 2, default: 0.00
  	change_column :account_transactions, :amount, :decimal, precision: 5, scale: 2, default: 0.00
  end

  def down
  end
end
