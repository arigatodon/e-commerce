class Product < ActiveRecord::Base
	  belongs_to :category
	  belongs_to :user
	  has_many :reviews	, dependent: :destroy
	  has_many :users
	  has_many :user_likes, through: :likes, :source => :user

	  #validates :name, presence: true
  	  validates :description, presence: true
  	  validates :price, presence: true
  	  validates :stock, presence: true

end
