class Category < ActiveRecord::Base
  has_many :product, dependent: :destroy
  validates :name, presence: true
end
