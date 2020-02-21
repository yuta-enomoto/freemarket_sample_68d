class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id]) 
    @item_image = @item.item_images[0].url
  end

  def new
  end

end
