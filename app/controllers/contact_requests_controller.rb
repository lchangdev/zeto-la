class ContactRequestsController < ApplicationController

  def create
    @contact_request = ContactRequest.new
    @contact_request.user = User.find(params[:user_id])

    if @contact_request.save
      ContactRequestMailer.new_contact_request_receipt(current_user, @contact_request.user).deliver
      ContactRequestMailer.new_contact_request(current_user, @contact_request.user).deliver
      flash[:notice] = "Successfully sent your request."
      redirect_to users_path
    else
      flash[:notice] = "Error please try again."
      render groups_path
    end
  end
end
