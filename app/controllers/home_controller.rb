class HomeController < ApplicationController

  def index
    @items_category = Item.includes(:user).where(stock_status:"1",category_id:"1")
    @items_brand = Item.includes(:user).where(stock_status:"1",brand_id:"1",)
    
  end

end