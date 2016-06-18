class AddColumnToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :product_price, :decimal
  end
end
