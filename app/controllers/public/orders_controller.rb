class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    
  end

  def complete
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :postage, :pay_method, :payment, :order_status)
  end
  
end
