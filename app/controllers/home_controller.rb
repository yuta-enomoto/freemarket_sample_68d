class HomeController < ApplicationController

  def index
    @items = Item.includes(:user)
  end

end
