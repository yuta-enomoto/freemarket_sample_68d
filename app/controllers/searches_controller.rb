class SearchesController < ApplicationController

  def detail_search
    @items_all = Item.all.date_desc
    @q = Item.ransack(params[:q])
    @search_item = Item.ransack(params[:q]) 
    @items = @search_item.result.page(params[:page])
    @search = params[:q][:name_cont]
  end

end
