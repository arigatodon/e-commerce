class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :content, presence: true

  has_many :user_likes, through: :likes, :source => :user
  has_many :likes, as: :likeable
end
