class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,              null: false
      t.text  :content,                  null: false
      t.integer :category_id,            null: false
      t.integer :sales_status_id,        null: false
      t.integer :shipping_fee_status_id, null: false
      t.string :prefecture_id,           null: false
      t.integer :scheduled_delivery_id,  null: false
      t.integer :price,                  null: false
      t.timestamps
    end
    add_foreign_key :items, :users, column: :user_id
  end
end
