class SearchesController < ApplicationController

  def detail_search
    if params[:q][:name_cont].empty?

    else
      @search_item = Item.ransack(params[:q])
      @items = @search_item.result.page(params[:page])
      @search = params[:q][:name_cont]
    end
  end

end