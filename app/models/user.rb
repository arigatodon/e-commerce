class User < ActiveRecord::Base
 
  before_save :deafult_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  enum role: [:admin, :client, :guest]
  validates :nickname, uniqueness: true

  has_many :products, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  def deafult_role
  	self.role ||= 2  	
  end
end
