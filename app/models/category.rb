class Category < ActiveRecord::Base
  has_many :products
  validates :name, presence: true
  
  def to_s
    self.name
  end
end
