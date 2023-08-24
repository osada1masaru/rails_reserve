class UsersController < ApplicationController
  def update
    @user = current_user
    @user.profile_image.attach(params[:profile_image])
    @user.name = params[:name]
    @user.introduction = params[:introduction]
    
    if @user.save
      flash[:notice] = "変更が完了しました"
      redirect_to :rooms
    else
      flash[:alert] = "変更に失敗しました"
      render "users/profile"
    end
  end

  def account
    @user = User.find_by(id: params[:id])
  end

  def profile
    @user = User.find_by(id: params[:id])
  end

  def edit_profile
    @user = current_user
  end
end
