class SearchesController < ApplicationController

  def index
    @items = Item.search(params[:keyword]).date_desc
    @items_all = Item.all.date_desc
    @search = params[:keyword]
  end

end
