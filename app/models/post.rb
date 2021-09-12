# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id, inverse_of: :posts
  belongs_to :post_category, inverse_of: :posts

  has_many :comments, class_name: 'PostComment', inverse_of: :post, dependent: :destroy
  has_many :likes, class_name: 'PostLike', inverse_of: :post, dependent: :destroy

  validates :title, :body, presence: true
end
