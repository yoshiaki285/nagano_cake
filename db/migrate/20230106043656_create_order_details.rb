class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :total_price, null: false
      t.integer :amount, null: false
      t.integer :product_status, null: false
      t.timestamps
    end
  end
end
