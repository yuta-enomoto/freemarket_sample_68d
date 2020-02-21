module CardsHelper
  def card_company(brand)
    case brand
    when "Visa"
      "credit-card_22@0.5.png"
    when "JCB"
      "credit-card_28@0.5.png"
    when "MasterCard"
      "credit-card_9@0.5.png"
    when "American Express"
      "credit-card_19@0.5.png"
    when "Diners Club"
      "credit-card_31@0.5.png"
    when "Discover"
      "credit-card_15@0.5.png"
    end
  end
end
