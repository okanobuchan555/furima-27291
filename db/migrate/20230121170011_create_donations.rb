class CreateDonations < ActiveRecord::Migration[6.0]
  def change
    create_table :donations do |t|
      t.string :card_number,    default: "",  null: false
      t.string :card_exp_month,    default: "",  null: false
      t.string :card_exp_year,    default: "",  null: false
      t.string :card_cvc,       default: "",  null: false
      t.references :order,               null: false,  foreign_key: true
      t.timestamps
    end
  end
end
