class SelesController < ApplicationController
  before_action :set_seles
  before_action :set_profits, only: :index
  include ChartHelper

  def index
    gon.category, gon.profit = category_profit(@seles) if @seles.present?
  end

  def history
    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: "売上履歴#{Date.today}.csv", type: :csv
      end
    end
  end

  private
  def set_seles
    @seles = Sele.includes(:item).where(user_id: current_user.id).date_desc.page(params[:page]).per(6)
  end

  def set_profits
    @profits = @seles.sum(:profit)
    @profit_yet = @seles.where(deposit: false).sum(:profit)
  end
end
