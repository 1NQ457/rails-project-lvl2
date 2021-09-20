# frozen_string_literal: true

class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: %i[edit update]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.creator = current_user
    if @comment.save
      redirect_to post_path(@post)
    else
      flash.now[:notice] = t('flash.empty_comment')
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
