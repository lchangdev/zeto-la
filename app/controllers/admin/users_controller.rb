module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin
    before_action :authenticate!

    def index
      @users = User.all.order('name asc')
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "Successfully deleted user."
      redirect_to admin_users_path
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "Successfully updated users information."
        redirect_to admin_users_path
      else
        flash[:notice] = "Did not update. Please try again."
        render :edit
      end
    end

    private

    def authorize_admin
      if signed_in?
        if current_user.role != 'admin'
          flash[:notice] = 'You are not authorized to do that.'
          redirect_to root_path
        end
      else
        flash[:notice] = 'You need to be signed in to do that.'
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:address, :tagline, :twitter, :github, :company_name, :cohort, :secondary_email)
    end
  end
end
