module ApplicationHelper
  #viewのselect_tagに使用。CardsHelperではうまく読み込めなかったので、ApplicationHelperに記述。
  def card_month
    month = [*1..12]
    exp_month = []
    month.each do |i|
      exp_month << [i.to_s.rjust(2, "0"), i]
    end
    return exp_month
  end

  def card_year
    year = [*2020..2030]
    exp_year = []
    year.each do |i|
      exp_year << [i.to_s.slice(2,3), i]
    end
    return exp_year
  end

  def picｋ_up
    brand = Brand.all.sample
    parent = Category.where(ancestry: nil)
    picｋ_up = parent.sample
    category_ary = Category.where("id = ? or ancestry = ? or ancestry LIKE(?)", picｋ_up.id, picｋ_up.id, "#{picｋ_up.id}/%")
    return brand, parent, picｋ_up, category_ary
  end
end