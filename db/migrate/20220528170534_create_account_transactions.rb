class CreateAccountTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :account_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :input_currency
      t.decimal :input_amount
      t.decimal :output_amount
      t.string :output_currency

      t.timestamps
    end
  end
end
