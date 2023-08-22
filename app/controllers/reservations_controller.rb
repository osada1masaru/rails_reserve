class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @room = Room.find(params[:id])
    @user_id = current_user.id
    @usr = User.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservation.new(reservation_params)
    @room = Room.find(params[:id])
    if @reservation.save!
      flash[:notice] = "予約完了"
      redirect_to :room
    else
      render :new
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def reservation_params
      params.require(:reservation).permit(:check_in, :check_out, :pepple)
    end
end
