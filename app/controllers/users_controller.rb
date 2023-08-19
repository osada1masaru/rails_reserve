class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    # @user = User.all
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

  protected
    def configure_permitted_parameters
      devise_parameter_sanitiser.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
