# frozen_string_literal: true

class ExchangeRate < ApplicationRecord
  validates :date, :rub_to_usd, :rub_to_eur, :rub_to_cny, presence: true
end
