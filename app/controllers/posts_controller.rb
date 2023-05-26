class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集完了"
    else
      render :edit
    end
  end

  def create
    @post = Post.create(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to new_post_path, notice: "投稿完了"
      else
        render :new
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"抹消完了"
  end

  def confirm
    @post = Post.new(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
