class HomeController < ApplicationController
  include PickupHelper

  def index
    @brand, @parent_categories, @picｋ_up_category, category_list = picｋ_up
    @items_category = Item.includes(:user).where(stock_status: true, category_id: category_list).date_desc
    @items_brand = Item.includes(:user).where(stock_status: true, brand_id: @brand.id).date_desc
  end
end 