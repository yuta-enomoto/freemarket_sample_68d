module PickupHelper
  def picｋ_up
    brand = Brand.all.sample
    parent = Category.where(ancestry: nil)
    picｋ_up = parent.sample
    category_ary = Category.where("id = ? or ancestry = ? or ancestry LIKE(?)", picｋ_up.id, picｋ_up.id, "#{picｋ_up.id}/%")
    return brand, parent, picｋ_up, category_ary
  end
end