class RoomsController < ApplicationController
  # before_action :set_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new 
  end

  def create
    @room = room.new(room_params)
    if @room.save
      flash[:notice] = "保存完了"
      redirect_to :rooms
    else
      flash[:alert] = "失敗しました"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
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
