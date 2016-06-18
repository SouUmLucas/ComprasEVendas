class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :product, index: true, foreign_key: true
      t.references :transactiontype, foreign_key: true
      t.integer :amount
      t.decimal :total_price

      t.timestamps null: false
    end
  end
end
