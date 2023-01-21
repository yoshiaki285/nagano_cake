class Item < ApplicationRecord
    
  has_one_attached :image
  has_many :order_details
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  
  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def add_tax_price
    (self.price * 1.1).round
  end
    
end
