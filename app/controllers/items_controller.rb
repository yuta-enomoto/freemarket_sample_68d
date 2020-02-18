class ItemsController < ApplicationController
  def show
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :price, :condition_id , :shipping_fee_who_id, :prefecture_id, :shipping_days_id, item_images_attributes: [:url])
  end

end