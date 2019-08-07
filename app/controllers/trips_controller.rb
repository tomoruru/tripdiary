class TripsController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy, :new, :index]
  before_action :correct_user, only: [:destroy]
  
  
  def create
    @trip = current_user.trips.build(trip_params)
    if @trip.save
      flash[:success] = 'tripを投稿しました'
      redirect_to trips_path
    else
      @trips = current_user.trips.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'tripの投稿に失敗しました。'
      render "trips/new"
    end
  end

  def destroy
    @trip.destroy
    flash[:success] = "tripを削除しました。"
    redirect_back(fallback_location: trips_path)
  end
  
  def new
    @trip = Trip.new
  end
  
  def index
    @trips = current_user.trips.order(id: :desc).page(params[:page])
  end
  
  def show
    @trip = Trip.find(params[:id])
  end
  
  
  def trip_params
    params.require(:trip).permit(:where, :transpotation, :hotel, :what_did, :image)
  end
  
  def correct_user
    @trip = current_user.trips.find_by(id: params[:id])
    unless @trip
      redirect_to trips_path
    end
  end
  
end
