class MembersController < ApplicationController
  def create
    @member = Member.new(user: current_user, post_id: params[:post_id])
    if @member.save
      flash[:notice] = "Successfully joined the event."
      redirect_to post_path(params[:post_id])
    else
      flash[:notice] = "There was an error. Please try again."
      redirect_to post_path(params[:post_id])
    end
  end
end
