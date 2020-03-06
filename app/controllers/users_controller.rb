class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update]

  def index
  end

  def show
    @items = current_user.items.date_desc.page(params[:page]).per(4)
  end

  def seller
    @user = User.find(params[:id])
    redirect_to users_path if current_user == @user
    @items = @user.items.includes(:item_images).date_desc.page(params[:page]).per(6)
  end

  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_furigana, :last_furigana, :birthday, :email)
  end
end