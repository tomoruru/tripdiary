class FavoritesController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :destroy]
  def create
    @trip = Trip.find(params[:trip_id])
    current_user.favorite(@trip)
    flash[:success] = "お気に入りに追加しました"
    redirect_to root_url
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    current_user.unfavorite(@trip)
    flash[:success] = "お気に入りを削除しました"
    redirect_to root_url
  end
end