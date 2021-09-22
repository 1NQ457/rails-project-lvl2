# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize_post, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = @post.comments.build
    @comment_collection = @post.comments.filter { |comment| comment.is_root? && !comment.id.nil? }
    @current_user_like = @post.likes.find_by(user: current_user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: t('flash.post_created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @post.update post_params
      redirect_to post_path(@post), notice: t('flash.post_updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path, notice: t('flash.post_destroyed')
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end

  def authorize_post
    authorize @post
  end
end
