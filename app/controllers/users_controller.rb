class UsersController < ApplicationController
  helper_method :sort_user_column, :sort_direction

  def index
    authenticate!

    if !params[:search] || params[:search].empty?
      @users = User.all.order(sort_user_column + " " + sort_direction)
      @posts = Post.all.order('created_at desc').limit(20)
    else
      @users = User.all.order(sort_user_column + " " + sort_direction).near(params[:search], 20)
      @posts = Post.all.order('created_at desc').near(params[:search], 20)

      user_count = @users.to_a.count
      post_count = @posts.to_a.count
      if user_count == 1
        word1 = ['is', 'Launcher']
      else
        word1 = ['are', 'Launchers']
      end

      if post_count == 1
        word2 = ['is', 'post']
      else
        word2 = ['are', 'posts']
      end

      flash[:notice] = "There #{word1.first} #{user_count} #{word1.last} and \n
        #{post_count} #{word2.last} within 20 miles of #{params[:search]}."
    end

    if signed_in?
      @user = User.find_by(id: current_user.id)
      @geojson = Array.new
      @users.each do |user|
        @geojson << {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [user.longitude, user.latitude]
          },
          properties: {
            address: user.address,
            cohort: user.cohort,
            company_name: user.company_name,
            name: user.name,
            email: user.email,
            image: user.image,
            id: user.id,
            tagline: user.tagline,
            twitter: user.twitter,
            github: user.github,
            :'marker-color' => '#E08283',
            :'marker-symbol' => 'circle',
            :'marker-size' => 'medium'
          }
        }
      end

      @posts.each do |post|
        @geojson << {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [post.longitude, post.latitude]
          },
          properties: {
            id: post.id,
            title: post.title,
            description: post.description,
            address: post.address,
            date: post.date,
            time: post.time,
            role: post.role,
            :'marker-color' => '#E87E04',
            :'marker-symbol' => 'circle',
            :'marker-size' => 'medium'
          }
        }
      end

      respond_to do |format|
        format.html
        format.json {render json: @geojson}
      end
    end
  end

  def edit
    authenticate!
    if current_user
      if current_user.id == params[:id]
        @user = User.find(params[:id])
      else
        flash[:notice] = "You are not authorized to do that."
        redirect_to root_path
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Successfully updated your information."
      redirect_to users_path
    else
      if @user.tagline.length > 160
        flash[:notice] = "Did not save. Please keep taglines under 160 characters."
        redirect_to users_path
      else
        flash[:notice] = "Did not save. Please try again."
        redirect_to users_path
      end
    end
  end

  def destroy
    @user = User.find(current_user)
    if @user.destroy
      flash[:notice] = "You have successfully deleted your account."
      redirect_to signout_path
    else
      flash[:notice] = "Unsuccessful. Please try again."
      render :index
    end
  end

  def home
    if current_user
      @user = User.find_by(id: current_user)
    end
  end

  def about

  end

  private

  def user_params
    params.require(:user).permit(:address, :tagline, :twitter, :github, :company_name, :cohort, :confirmation)
  end

  def sort_user_column
    # need to make more specific for security
    User.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
