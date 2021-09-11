# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @user = users(:one)
    sign_in @user
  end

  test 'should_create' do
    attrs = { content: 'Test String' }

    assert_difference('PostComment.count') do
      post post_comments_path(@post), params: { post_comment: attrs }
    end

    assert_redirected_to post_path(@post)
  end

  test 'should_create_nested' do
    comment = post_comments(:one)
    attrs = { content: 'Test String', parent_id: comment.id }
    post post_comments_path(@post), params: { post_comment: attrs }

    nested = PostComment.find_by(content: attrs[:content])

    assert_redirected_to post_path(@post)
    assert_equal nested.parent, comment
  end

  test 'should_update' do
    comment = post_comments(:one)
    attrs = { content: 'New Test String' }
    patch post_comment_path(@post, comment), params: { post_comment: attrs }

    assert_redirected_to post_path(@post)
    assert_equal comment.reload.content, attrs[:content]
  end
end
