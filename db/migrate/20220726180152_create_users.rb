class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.string :last_name
      t.string :last_name_kana
      t.string :first_name
      t.string :first_name_kana
      t.date   :birth_day
      t.timestamps
    end
  end
end
