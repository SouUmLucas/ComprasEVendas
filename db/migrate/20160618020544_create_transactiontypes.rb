class CreateTransactiontypes < ActiveRecord::Migration
  def change
    create_table :transactiontypes do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
