class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end
  
  def create
    # binding.pry
    @item = Item.find(cart_item_params[:item_id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        if Item.find_by(name: @cart_item.item.name)
          cart_item.amount += @cart_item.amount.to_i
          cart_item.save
        else
          @cart_item.save
        end
      end
      redirect_to cart_items_path
  end
  
  def update
    
  end
  
  def destroy
    
    
  end
  
  def destroy_all
    @cart_items = current_customer.cart_items
    current_customer.cart_items.destroy_all
    redirect_to items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
