class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create 
    if @post = Post.create(post_params)
      flash[:success] = "You post has been created!"
      redirect_to posts_path
    else
      flash.new[:alert] = "Your new post couldn't be created! Please check the form"
      render :new
    end
  end

  def show
    flash.now[:success] = "Here is the single post you wanted to review!"
  end

  def edit
    flash.now[:success] = "Please edit your post using the fields provided below"
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Updated failed. Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private 

  def post_params
  	params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end 


end
