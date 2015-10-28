class User < ActiveRecord::Base
 
  before_save :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum role: [:admin, :client, :guest]
  validates :nickname, uniqueness: true
  #dependencias de productos y review
  has_many :products, :dependent => :destroy
  has_many :reviews, :dependent => :destroy
  #relacion n a n
  has_many :likes, as: :likeable
  has_many :product_likes, through: :likes, source: :product
  has_many :review_likes, through: :likes, source: :review
 ##ultima modificacion----------
 has_many :product_likes, through: :likes, source: :likeable, source_type: 'Product'
 has_many :review_likes, through: :likes, source: :likeable, source_type: 'Review'

  def default_role
  	self.role ||= 1	
  end
end
