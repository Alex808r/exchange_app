# frozen_string_literal: true

class ExchangeGraphService
  def self.execute(exchange_rates)
    exchange_rates.map do |exchange_rate|
      {
        date: exchange_rate.date.to_s,
        rub_to_usd: exchange_rate.rub_to_usd,
        rub_to_eur: exchange_rate.rub_to_eur,
        rub_to_cny: exchange_rate.rub_to_cny
      }
    end
  end
end
