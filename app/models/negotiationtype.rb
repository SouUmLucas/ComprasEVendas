class Negotiationtype < ActiveRecord::Base
  validates_presence_of :description

  has_many :negotiations, :dependent => :delete_all
end
