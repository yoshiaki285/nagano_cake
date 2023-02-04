class Order < ApplicationRecord
  enum pay_method: { credit_card: 0, transfer: 1 }
  enum order_status: { wait_pay: 0, pay_confirm: 1, in_product: 2, preparing: 3, sent: 4 }
  
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details
  
    def address_display
      '〒' + postal_code + ' ' + address
    end
  
end
