# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    exchange_rates = ExchangeRate.order(:date).last(28)
    @graph_data = ExchangeGraphService.execute(exchange_rates)
  end

  def table
    exchange_week = ExchangeRate.order(date: :asc).limit(28).each_slice(7)

    @rub_to_usd = ExchangeTableService.new.execute(exchange_week:, valute: :rub_to_usd)
    @rub_to_eur = ExchangeTableService.new.execute(exchange_week:, valute: :rub_to_eur)
    @rub_to_cny = ExchangeTableService.new.execute(exchange_week:, valute: :rub_to_cny)
  end
end
