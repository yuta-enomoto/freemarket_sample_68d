class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :building_name
      t.string :phone_number
      t.integer :prefecture_id, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
