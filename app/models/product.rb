class Product < ActiveRecord::Base
  validates_presence_of :description, :price, :product_type
  has_many :negotiations, :dependent => :delete_all
end
