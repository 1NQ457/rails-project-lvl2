# frozen_string_literal: true

class AddPostCategoryToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :post_category, foreign_key: true, null: false, default: 1
  end
end
