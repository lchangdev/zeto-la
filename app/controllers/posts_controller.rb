class PostsController < ApplicationController
  helper_method :sort_post_column, :sort_direction
  before_action :authenticate!

  def index
    @posts = Post.all.order(sort_post_column + " " + sort_direction).page(params[:page]).per(20)
    @my_posts = Post.all.where(author: current_user).order(sort_post_column + " " + sort_direction)
    @events_attending = Member.all.where(user_id: current_user.id)
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
      redirect_to posts_path
    else
      flash[:notice] = "There was an error. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Successfully edited your post."
      redirect_to post_path(@post)
    else
      flash.now[:notice] = "Did not save. Please try again."
      render :edit
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

  def sort_post_column
    %w[created_at updated_at title role].include?(params[:sort]) ? params[:sort] : 'created_at'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
