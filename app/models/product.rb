class Product < ActiveRecord::Base
	  belongs_to :category
	  has_many :reviews	, dependent: :destroy
	  #validates :name, presence: true
  	  validates :description, presence: true
  	  validates :price, presence: true
  	  validates :stock, presence: true
end
