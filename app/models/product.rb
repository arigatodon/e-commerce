class Product < ActiveRecord::Base
	  mount_uploader :image, ImageUploader
	  belongs_to :category
	  belongs_to :user
	  has_many :reviews	, dependent: :destroy
	  has_many :users
	  has_many :user_likes, through: :likes, :source => :user
	  has_many :likes, as: :likeable
	  #has_and_belongs_to_many :category
	  #validates :name, presence: true
  	  validates :description, presence: true
  	  validates :price, presence: true
  	  validates :stock, presence: true
  	  validates :name, presence:true

end
