class ItemsController < ApplicationController
  def show
    @item = Item.find(1)
    @item_image = Item_images.find(1)
  end

  def new
  end

end
