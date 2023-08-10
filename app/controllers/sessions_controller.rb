class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to "/"
    else
      flash[:alert] = "Invalid email/password combination"
      render "new"
  end

  def destroy
    log_out
    flash[:notice] = "Logged out!"
    redirect_to "/"
  end
end