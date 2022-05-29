class CreateFxes < ActiveRecord::Migration[6.1]
  def change
    create_table :fxes do |t|
      t.string :name
      t.string :currency
      t.string :currency_symbol
      t.decimal :rate, null: false, default: 1.00, precision: 30, scale: 2

      t.timestamps
    end
  end
end
