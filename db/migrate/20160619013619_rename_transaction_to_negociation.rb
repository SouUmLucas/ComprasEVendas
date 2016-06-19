class RenameTransactionToNegociation < ActiveRecord::Migration
  def change
    rename_column :transactions, :transactiontype_id, :negotiationtype_id
    rename_table :transactions, :negotiations
    rename_table :transactiontypes, :negotiationtypes
  end
end
