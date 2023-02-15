class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)
      @order_details.update_all(product_status: 1) if @order.order_status == "pay_confirm"
    end
    redirect_to admin_order_path(@order.id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
