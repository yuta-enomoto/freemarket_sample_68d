class HomeController < ApplicationController

  def index
    @brand, @parent_categories, @picｋ_up_category, category_list = picｋ_up
    @items_category = Item.includes(:user).where(stock_status: true, category_id: category_list).date_desc
    @items_brand = Item.includes(:user).where(stock_status: true, brand_id: @brand.id).date_desc

    # @items_category = Item.includes(:user).where(stock_status:"1",category_id:"1").date_desc
    # @items_brand = Item.includes(:user).where(stock_status:"1",brand_id:"1",).date_desc
    # @parent_categories = Category.where(ancestry: nil)
  end

  private
  def picｋ_up
    brand = Brand.all.sample
    parent = Category.where(ancestry: nil)
    picｋ_up = parent.sample
    category_ary = Category.where("id = ? or ancestry = ? or ancestry LIKE(?)", picｋ_up.id, picｋ_up.id, "#{picｋ_up.id}/%")
    return brand, parent, picｋ_up, category_ary
  end
end 