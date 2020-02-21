class HomeController < ApplicationController

  def index
    @items = Item.includes(:user).where(stock_status:"1",category_id:"1")
    @_items = Item.includes(:user).where(stock_status:"1",brand_id:"1",)
    
   
    
    
  end

end


# Classmate.where(class_id: 2, club_name: 'tennis')
# Classmate.where(class_id: 2).where(club_name: 'tennis')