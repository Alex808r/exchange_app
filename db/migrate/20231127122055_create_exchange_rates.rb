# frozen_string_literal: true

class CreateExchangeRates < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_rates do |t|
      t.date :date, null: false
      t.decimal :rub_to_usd, precision: 10, scale: 4
      t.decimal :rub_to_eur, precision: 10, scale: 4
      t.decimal :rub_to_cny, precision: 10, scale: 4

      t.timestamps
    end

    add_index :exchange_rates, :date, unique: true
  end
end
