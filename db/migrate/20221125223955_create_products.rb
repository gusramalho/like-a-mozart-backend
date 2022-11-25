class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.timestamps
      t.decimal :price, precision: 8, scale: 2, null: false
      t.integer :family, null: false
    end

    add_reference :products, :brand, null: false, foreign_key: true, index: true, type: :uuid
    add_reference :products, :category, null: false, foreign_key: true, index: true, type: :uuid
  end
end
