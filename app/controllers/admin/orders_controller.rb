class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_status_params)
    redirect_to admin_order_path(@order.id)
  end
  
  private
  
  def order_status_params
    params.require(:order).permit(:order_status)
  end
  
  
  
end
