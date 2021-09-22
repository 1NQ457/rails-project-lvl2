# frozen_string_literal: true

class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  validates :post_id, :user_id, uniqueness: true
end
