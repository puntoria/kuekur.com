class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :name, limit: 128, null: false
      t.string :email, null: false
      t.integer :age
      t.date :birth_date
      t.integer :gender, default: 0
      t.string :website, limit: 128
      t.text :bio
      t.string :phone_number, limit: 128
      t.boolean :email_verified, default: false
      t.boolean :phone_verified, default: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
