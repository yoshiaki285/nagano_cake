class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
  end

  def edit
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end
  
  def update
  end
  
  private

  def item_params
      params.require(:item).permit(:name, :introduction, :price, :image, :genres_id, :is_active)
  end
end
