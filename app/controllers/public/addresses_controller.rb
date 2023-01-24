class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @customer = current_costomer
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.delete
    redirect_to addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:costomer_id, :name, :postal_code, :address)
  end
  
end
