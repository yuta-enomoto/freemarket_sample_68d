class SelesController < ApplicationController
  before_action :set_seles
  before_action :set_sele, only: [:request_one, :cancel_one]
  before_action :set_deposit_yet, only: [:index, :deposit_list, :request_all]
  before_action :set_deposit_already, only: [:deposit_list, :cancel_all]
  include ChartHelper

  def index
    @profits = @seles.sum(:profit)
    @profit_yet = @deposit_yet.sum(:profit)
    if @seles.present?
      gon.category, gon.profit = category_profit(@seles)
    else
      gon.category = []
      gon.profit = []
    end
  end

  def history
    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: "売上履歴#{Date.today}.csv", type: :csv
      end
    end
  end

  def deposit_list

  end

  def request_all
    @deposit_yet.each do |sele|
      sele.deposit = true
      sele.save
    end
    redirect_to deposit_list_seles_path
  end

  def request_one
    @sele.deposit = true
    @sele.save
    redirect_to deposit_list_seles_path
  end

  def cancel_all
    @deposit_already.each do |sele|
      sele.deposit = false
      sele.save
    end
    redirect_to deposit_list_seles_path
  end

  def cancel_one
    @sele.deposit = false
    @sele.save
    redirect_to deposit_list_seles_path
  end

  private
  def set_seles
    @seles = Sele.includes(:item).where(user_id: current_user.id).date_desc.page(params[:page]).per(6)
  end

  def set_sele
    @sele = Sele.find(params[:id])
  end

  def set_deposit_already
    @deposit_already = @seles.where(deposit: true)
  end

  def set_deposit_yet
    @deposit_yet = @seles.where(deposit: false)
  end
end
