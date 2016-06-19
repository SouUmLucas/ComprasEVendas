class Negotiation < ActiveRecord::Base
  validates_presence_of :product_id, :negotiationtype_id, :amount, :product_price
  belongs_to :product
  belongs_to :negotiationtype
end
