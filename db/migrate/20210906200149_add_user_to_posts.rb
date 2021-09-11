# frozen_string_literal: true

class AddUserToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :user, foreign_key: true, null: false, default: 1
  end
end
