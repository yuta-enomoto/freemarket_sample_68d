class SearchesController < ApplicationController

  def detail_search
    @search_item = Item.ransack(params[:q])
    @items = @search_item.result.page(params[:page])
    @search = params[:q][:name_cont]
  end

end