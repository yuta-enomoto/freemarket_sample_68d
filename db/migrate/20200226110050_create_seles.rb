class CreateSeles < ActiveRecord::Migration[5.2]
  def change
    create_table :seles do |t|
      t.integer :revenue,                   null: false
      t.integer :profit,                    null: false
      t.boolean :deposit,                   null: false, default: false
      t.references :user,                   null: false, foreign_key: true
      t.references :item,                   null: false, foreign_key: true
      t.references :order,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
