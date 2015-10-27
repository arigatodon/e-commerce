class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :likeable, polymorphic: true
  #valida que solo tenga un like por user
  validates :product_id, uniqueness: { scope: :user_id}
end
