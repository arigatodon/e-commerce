class AddLikeableToLike < ActiveRecord::Migration
  def change
    add_reference :likes, :likeable, polymorphic: true, index: true
  end
end
