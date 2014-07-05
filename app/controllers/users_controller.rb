class UsersController < ApplicationController
  def index
    authenticate!
    @users = User.all.order(:name)
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
    if signed_in?
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

  private

  def user_params
    params.require(:user).permit(:address, :cohort, :company_name, :confirmation)
  end
end
