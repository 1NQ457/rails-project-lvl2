# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  test 'should get index' do
    get posts_path
    assert_response :success
  end

  test 'should get new' do
    sign_in @user
    get new_post_path
    assert_response :success
  end

  test 'should get show' do
    get post_path(@post)
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user
    get edit_post_path(@post)
    assert_response :success
  end

  test 'should create post' do
    sign_in @user
    attrs = {
      title: 'Title',
      body: 'Body',
      post_category_id: @post.post_category_id
    }

    assert_difference('Post.count') do
      post posts_path, params: { post: attrs }
    end

    assert_redirected_to post_path(Post.last)
  end

  test 'should update post' do
    sign_in @user
    attrs = {
      title: 'Title',
      body: 'Body'
    }

    patch post_path(@post), params: { post: attrs }

    assert_redirected_to post_path(@post)
  end

  test 'should destroy post' do
    sign_in @user
    assert_difference('Post.count', -1) do
      delete post_path(@post)
    end

    assert_redirected_to posts_path
  end
end
