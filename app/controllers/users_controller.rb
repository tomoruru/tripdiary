class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザ-を登録しました"
      redirect_to @user
    else
      flash[:danger] = "ユーザーの登録に失敗しました。"
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.favorite_trips
  end
  
  private
  
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
