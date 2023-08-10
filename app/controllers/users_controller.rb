class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:notice] = "Successfully registered a new user"
      redirect_to "/"
    else
      render "users/new"
    end
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
