# frozen_string_literal: true

class Posts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @like = @post.likes.build(user: current_user)
    @like.save

    redirect_to @post
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)
    @like.destroy

    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
