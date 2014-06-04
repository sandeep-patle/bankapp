class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :mobile_number
      t.string :city

      t.timestamps
    end
  end
end
