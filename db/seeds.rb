# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

start_date = 1.month.ago.to_date
end_date = Date.today

(start_date..end_date).each do |date|
  ExchangeRateService.fetch_and_save_rates(date)
end
