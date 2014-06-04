class CreateAccountTransactions < ActiveRecord::Migration
  def change
    create_table :account_transactions do |t|
      t.integer :from_account_number
      t.integer :to_account_number
      t.decimal :amount

      t.timestamps
    end
  end
end
