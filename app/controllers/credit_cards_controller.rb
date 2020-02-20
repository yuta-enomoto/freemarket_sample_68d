class CreditCardsController < ApplicationController
  require "payjp"

  def new
    card = CreditCard.where(user_id: current_user.id)
  end

  def edit
    card = CreditCard.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    binding.pry
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "edit"
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "edit" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      default_card_information = customer.cards.retrieve(card.card_id)
      @card_number = "**** **** **** " + default_card_information.last4
      @exp_month = default_card_information.exp_month.to_s.rjust(2, "0")
      @exp_year = default_card_information.exp_year.to_s.slice(2,3)
      @card_name = default_card_information.name.to_s
      @card_brand = card_company(default_card_information.brand)
    end
  end

  def card_company(brand)
    case brand
    when "Visa"
      card_brand = "credit-card_22@0.5.png"
    when "JCB"
      card_brand = "credit-card_28@0.5.png"
    when "MasterCard"
      card_brand = "credit-card_9@0.5.png"
    when "American Express"
      card_brand = "credit-card_19@0.5.png"
    when "Diners Club"
      card_brand = "credit-card_31@0.5.png"
    when "Discover"
      card_brand = "credit-card_15@0.5.png"
    end
  end
end
