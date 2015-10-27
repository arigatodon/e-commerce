class Like < ActiveRecord::Base
  belongs_to :user
  
  belongs_to :likeable, polymorphic: true
  #valida que solo tenga un like por user

  validates :likeable_id, uniqueness: {scope: [:user_id, :likeable_type]}
end
