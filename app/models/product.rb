class Product < ActiveRecord::Base

	  validates :title, presence: true
  	  validates :description, presence: true
  	  validates :price, presence: true
  	  validates :stock, presence: true
end
