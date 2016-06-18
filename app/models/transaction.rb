class Transaction < ActiveRecord::Base
  validates_presence_of :product_id, :transactiontype_id, :amount, :product_price
  has_many :product
end
