# frozen_string_literal: true

class AddIndexToPostLikes < ActiveRecord::Migration[6.1]
  def change
    remove_index :post_likes, :user_id
    add_index :post_likes, :user_id, unique: true
    remove_index :post_likes, :post_id
    add_index :post_likes, :post_id, unique: true
  end
end
