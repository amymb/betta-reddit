class PostsController < ApplicationController

  before_action :authenticate_user, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to root_path
    else
      flash[:notice] = "Sign up to create a post!"
      redirect_to sign_up_path
    end
  end



  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :created_at, :updated_at)
  end

end
