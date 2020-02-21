class OrdersController < ApplicationController
  def new
    @item = Item.find(1) #TODO 仮置き「TOPページ完成後に修正→params[:id]」
    @item_image = @item.item_images[0].url
  end
end
