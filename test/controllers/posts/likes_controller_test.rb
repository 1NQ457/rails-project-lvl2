# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should_create' do
    post = posts(:two)

    assert post post_likes_path(post)
    assert_equal 2, post.reload.likes.size
    assert_redirected_to post_path(post)
  end

  test 'should_destroy' do
    like = post_likes(:one)
    post = posts(:one)

    assert delete post_like_path(post, like)
    assert_equal 0, post.reload.likes.size
    assert_redirected_to post_path(post)
  end
end
