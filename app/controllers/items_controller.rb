class ItemsController < ApplicationController

  def show
    @item = Item.find(1)
    @item_image = @item.item_images[0]
    @item_images_sub1 = @item.item_images
  end

  

  def new
  end

end
