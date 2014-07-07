class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    authenticate!

    @user = User.find_by(id: current_user.id)

    if !params[:search] || params[:search].empty?
      @users = User.all.order(sort_column + " " + sort_direction)
    else
      @users = User.all.near(params[:search], 50)
      count = @users.to_a.count
      if count == 1
        word = ['is', 'Launcher']
      else
        word = ['are', 'Launchers']
      end
      flash[:notice] = "There #{word.first} #{@users.to_a.count} #{word.last} within 50 miles of #{params[:search]}."
    end

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
          :'marker-color' => '#65C6BB',
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

  def home
    if current_user
      @user = User.find_by(id: current_user)
    end
  end

  def edit
    authenticate!
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Successfully updated your information."
      redirect_to users_path
    else
      flash[:notice] = "Did not save. Please try again."
      render :new
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

  private

  def user_params
    params.require(:user).permit(:address, :cohort, :company_name, :confirmation)
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
