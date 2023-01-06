class OrderDetail < ApplicationRecord
  enum product_status: { cannot_start: 0, wait_product: 1, in_product: 2, complete: 3}
end
