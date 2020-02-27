module ChartHelper
  def category_profit(seles)
    category_names =[]
    profits =[]

    seles.each do |sele|
      category_name = sele.category
      profit = sele.profit
      if profit.present?
        category_names << category_name
        profits << profit
      end
    end

    return category_names, profits
  end
end