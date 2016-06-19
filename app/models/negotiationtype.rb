class Negotiationtype < ActiveRecord::Base
  validates_presence_of :description
  has_one :negotiations
end
