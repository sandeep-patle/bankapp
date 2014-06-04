class CreateAccountTransactions < ActiveRecord::Migration
  def change
    create_table :account_transactions do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.decimal :amount

      t.timestamps
    end
  end
end
