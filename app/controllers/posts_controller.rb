class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created a post."
      redirect_to users_path
    else
      flash[:notice] = "There was an error. Please try again."
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :address, :date, :time, :role)
  end
end
