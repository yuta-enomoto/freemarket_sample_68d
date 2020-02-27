class SelesController < ApplicationController
  def index
    @seles = Sele.includes(:item).where(user_id: current_user.id).date_desc.page(params[:page]).per(６)
  end
end
