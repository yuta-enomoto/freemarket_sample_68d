class LikesController < ApplicationController
  def index
    @items_like = Like.where(user_id: current_user.id,item_id:  item_id)
    
  end

  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    get_item
  end

  def show
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    @like.destroy
    get_item
  end

  def get_item
    @item = Item.find(params[:item_id])
  end 
  
end