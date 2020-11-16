class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product, null: false
      t.text :exception, null: false
      t.integer :category_id, null: false
      t.integer :condithon_id, null: false
      t.integer :payer_id, null: false
      t.integer :lovation_id, null: false
      t.integer :send_day_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
