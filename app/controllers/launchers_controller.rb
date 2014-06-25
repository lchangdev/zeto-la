class LaunchersController < ApplicationController
  def index
    @launchers = Launcher.all
    @launcher = Launcher.new
    @geojson = Array.new

    @launchers.each do |launcher|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [launcher.longitude, launcher.latitude]
        },
        properties: {
          address: launcher.address,
          :'marker-color' => '#65C6BB',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }

    end

    respond_to do |format|
      format.html # default is html render the index page { render :index }
      format.json {render json: @geojson} # respond with the created JSON object
    end
  end

  def new
    @launcher = Launcher.new
  end

  def create
    @launcher = Launcher.new(launcher_params)

    if @launcher.save
      flash[:notice] = "success."
      redirect_to launchers_path
    end
  end

  def home

  end

  private

  def launcher_params
    params.require(:launcher).permit(:address, :cohort, :company_name)
  end
end
