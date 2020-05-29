class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null:false
      t.integer :item_id, null:false
      t.integer :item_amount, null:false
      t.integer :tax_price, null:false
      t.integer :made_process, null:false, default:0
      t.timestamps
    end
  end
end
