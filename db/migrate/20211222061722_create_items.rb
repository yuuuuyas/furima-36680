class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,           null: false
      t.string :explanation,         null: false
      t.string :category_id,         null: false
      t.string :status_id,           null: false
      t.string :delivery_caharge_id, null: false
      t.string :area_id,             null: false
      t.string :delivery_date_id,    null: false
      t.string :price,               null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
