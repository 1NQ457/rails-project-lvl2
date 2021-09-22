# frozen_string_literal: true

class RemoveUniqueIndexFromPostLikes < ActiveRecord::Migration[6.1]
  def change
    remove_index :post_likes, :user_id, unique: true
    add_index :post_likes, :user_id
    remove_index :post_likes, :post_id, unique: true
    add_index :post_likes, :post_id
  end
end
