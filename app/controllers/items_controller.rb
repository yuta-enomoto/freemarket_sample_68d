class ItemsController < ApplicationController
  def show
    @item = Item.find(1)
    @item_images = @item.item_images

    
  end

  

  def new
  end

end
