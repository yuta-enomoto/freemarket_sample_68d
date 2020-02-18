class ItemsController < ApplicationController
  def show
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    # binding.pry

    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, item_images_attributes: [:url])
  end

end