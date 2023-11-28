# frozen_string_literal: true

class ExchangeTableService
  def initialize
    @differences = []
  end

  def execute(exchange_week:, valute:)
    exchange_week.map do |week|
      first_number = week.first.send(valute)
      last_number = week.last.send(valute)

      percent = calculate_percent_difference(first_number, last_number)
      @differences << [last_number.to_f.round(2), percent]
    end
    @differences
  end

  def calculate_percent_difference(first, last)
    percent_difference = ((last - first) / first) * 100
    "#{percent_difference.round(2)} %"
  end
end
