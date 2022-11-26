class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.date :birthdate, null: false
      t.string :phone, null: false
      t.string :address_zip_code, limit: 8
      t.string :address_street, null: false
      t.string :address_number, null: false
      t.string :address_complement
      t.string :address_state, limit: 2
      t.string :address_city, null: false
      t.boolean :receive_emails, null: false
    end

    add_index :users, :email, unique: true
  end
end
