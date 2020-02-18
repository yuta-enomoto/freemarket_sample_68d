class UsersController < ApplicationController
  before_action :set_user, expect: :show
  before_action :move_to_index, only: [:index, :edit]

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_furigana, :last_furigana, :birthday, :email)
  end

  def set_user
    @user = current_user
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end