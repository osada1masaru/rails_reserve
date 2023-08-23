class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  helper_method :current_user

  def index
    @rooms = Room.all
  end

  def new
    @room = current_user.rooms.new 
  end

  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      flash[:notice] = "施設情報登録完了"
      redirect_to :rooms
    else
      flash[:alert] = "施設情報の登録に失敗しました"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ルームを削除しました"
    redirect_to :rooms
  end

  private
    def room_params
      params.require(:room).permit(:name, :details, :price, :address, :image, :user_id)
    end

end
