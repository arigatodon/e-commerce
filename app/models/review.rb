class Review < ActiveRecord::Base
  belongs_to :product
  validates :content, presence: true
end
