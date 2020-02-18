class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :description
      t.integer :price, index: true
      t.boolean :stock_status,  default: true
      t.integer :condition_id,  foreign_key: true
      t.integer :shipping_fee_who_id,  foreign_key: true
      t.integer :prefecture_id,  foreign_key: true
      t.integer :shipping_days_id, foreign_key: true
      t.references :user, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :category,  foreign_key: true
      t.timestamps
    end
  end
end
