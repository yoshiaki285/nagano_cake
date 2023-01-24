class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
    @customer = current_customer
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @addresses = Address.all
    @customer = current_customer
    @address = Address.new(addresses_params)
    @address.customer_id = @customer.id
    @address.save
    redirect_to addresses_path
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(addresses_params)
    redirect_to addresses_path
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.delete
    redirect_to addresses_path
  end
  
  private
  
  def addresses_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
  
end
