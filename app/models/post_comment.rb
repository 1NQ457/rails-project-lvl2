# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry

  belongs_to :creator, class_name: 'User', foreign_key: :user_id, inverse_of: :post_comments
  belongs_to :post

  validates :content, presence: true
end
