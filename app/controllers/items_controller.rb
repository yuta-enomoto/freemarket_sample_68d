class ItemsController < ApplicationController
  def show
    
  end
  def new
  end

  def index
    @items = Item.includes(:users)
  end
end
