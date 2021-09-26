# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should_create' do
    post = posts(:two)

    assert_difference('PostLike.count') do
      post post_likes_path(post)
    end

    assert_redirected_to post_path(post)
  end

  test 'should_destroy' do
    like = post_likes(:one)
    post = posts(:one)

    assert_difference('PostLike.count', -1) do
      delete post_like_path(post, like)
    end
    assert_redirected_to post_path(post)
  end
end
