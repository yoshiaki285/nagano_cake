class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    
    is_updated = true
    if  @order_detail.update(order_detail_params)
      @order.update(order_status: 2) if @order_detail.product_status == "in_product"
      @order_details.each do |order_detail|
        if order_detail.product_status != "complete"
          is_updated = false
        end
      end
      @order.update(order_status: 3) if is_updated
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:product_status)
  end
end
