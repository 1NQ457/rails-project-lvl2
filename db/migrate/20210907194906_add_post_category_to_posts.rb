# frozen_string_literal: true

class AddPostCategoryToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :post_category, foreign_key: true
  end
end
