class UsersController < ApplicationController
  before_action :set_user expect: [:show]
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
    params.require(:user).permit(:nickname, :first_name, :last_name, :first_furigana, :last_furigana, :birthday)
  end

  def set_user
    @user = current_user
  end
end

t.string :nickname,           null: false
t.string :first_name,         null: false
t.string :last_name,          null: false
t.string :first_furigana,     null: false
t.string :last_furigana,      null: false
t.date :birthday,             null: false
t.string :email,              null: false, default: ""
t.string :encrypted_password, null: false, default: ""