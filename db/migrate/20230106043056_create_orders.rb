class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false
      t.integer :pay_method, null: false
      t.integer :payment, null: false
      t.integer :order_status, null: false
      t.timestamps
    end
  end
end
