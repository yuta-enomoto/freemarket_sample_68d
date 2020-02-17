class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def diary_params
    params.require(:address).permit(:postal_code, :address1, :address2, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
