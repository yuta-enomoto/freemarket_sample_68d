module ChartHelper
  def category_profit(seles)
    profits =[]
    categorys = @seles.group_by{|x| x[:category] }.keys
    categorys.map do |category|
      profit = seles.where(category: category).sum(:profit)
      if profit.present?
        profits << profit
      end
    end
    return categorys, profits
  end
end