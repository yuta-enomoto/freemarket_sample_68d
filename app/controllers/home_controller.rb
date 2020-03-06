class HomeController < ApplicationController

  def index
    @brand, @parent_categories, @picｋ_up_category, category_list = pick_up
    @items = Item.includes(:user).where(stock_status: true).date_desc
    @items_category = @items.where(category_id: category_list)
    @items_brand = @items.where(brand_id: @brand.id)
  end

  private
  def pick_up
    brand = Brand.all.sample
    parent = Category.where(ancestry: nil)
    picｋ_up = parent.sample
    category_ary = Category.where("id = ? or ancestry = ? or ancestry LIKE(?)", picｋ_up.id, picｋ_up.id, "#{picｋ_up.id}/%")
    return brand, parent, picｋ_up, category_ary
  end
end 