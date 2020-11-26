class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :post_code,      null: false
      t.integer :prefecture,    null: false
      t.string :city,           null: false
      t.string :house_num,      null: false
      t.string :building_name
      t.string :tel,            null: false
      t.references :trade,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
