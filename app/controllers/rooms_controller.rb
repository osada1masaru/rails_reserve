class RoomsController < ApplicationController
  before_action :set_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "保存完了"
    else
      flash[:alert] = "失敗しました"
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    new_params = room_params

    if @room.update(new_params)
      flash[:notice] = "保存完了"
    else
      flash[:alert] = "失敗しました"
    end
    redirect_back(fallback_location: rewuest.referer)
  end

  def destroy
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, :introdction, :price, :address)
    end
end
