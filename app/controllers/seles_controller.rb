class SelesController < ApplicationController
  before_action :set_seles
  before_action :set_profits

  def index
  end

  def history
    
  end

  private
  def set_seles
    @seles = Sele.includes(:item).where(user_id: current_user.id).date_desc.page(params[:page]).per(6)
  end

  def set_profits
    @profits = @seles.sum(:profit)
  end
end
