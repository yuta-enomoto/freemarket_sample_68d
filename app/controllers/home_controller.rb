class HomeController < ApplicationController

  def index
    @brand, @parent_categories, @picｋ_up_category, category_list = picｋ_up
    @items_category = Item.includes(:user).where(stock_status: true, category_id: category_list).date_desc
    @items_brand = Item.includes(:user).where(stock_status: true, brand_id: @brand.id).date_desc

    # @items_category = Item.includes(:user).where(stock_status:"1",category_id:"1").date_desc
    # @items_brand = Item.includes(:user).where(stock_status:"1",brand_id:"1",).date_desc
    # @parent_categories = Category.where(ancestry: nil)
  end
end 