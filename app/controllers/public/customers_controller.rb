class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end


def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
end