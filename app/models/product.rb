class Product < ActiveRecord::Base
  validates_presence_of :description, :price
end
