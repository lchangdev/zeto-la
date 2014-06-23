class LaunchersController < ApplicationController
  def index
    @launchers = Launcher.all
  end

  def new
    @launcher = Launcher.new
  end

  def create
    @launcher = Launcher.find(launcher_params)

    if @launcher.save
      flash[:notice] = "success."
      redirect_to launchers_path
    else
      flash[:notice] = "fail."
      redirect_to launchers_path
    end
  end

  private

  def launcher_params
    params.require(:launcher).permit(:first_name, :last_name, :address, :company_name, :cohort)
  end
end
