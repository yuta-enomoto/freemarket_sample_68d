class SearchesController < ApplicationController
  before_action :set_ransack 

  def index
    @items = Item.search(params[:keyword]).date_desc
    @search = params[:keyword]
  end

  def detail_search
    @search_item = Item.ransack(params[:q]) 
    @items = @search_item.result.page(params[:page])
    @search = params[q: [:name_cont]]
  end

  private

  def set_ransack
    @items_all = Item.all.date_desc
    @q = Item.ransack(params[:q])
  end

end
