class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @member = Member.new
    @members = Member.where(post_id: params[:id])
    @current_member = Member.find_by(user_id: current_user.id)
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      flash[:notice] = "Successfully created a post."
      redirect_to users_path
    else
      flash[:notice] = "There was an error. Please try again."
      render :new
    end
  end

  def destroy
    @post = Post.find_by(author: current_user)
    if @post.destroy
      flash[:notice] = "You have successfully deleted your post."
      redirect_to users_path
    else
      flash[:notice] = "Unsuccessful. Please try again."
      render users_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :address, :date, :time, :role)
  end
end
