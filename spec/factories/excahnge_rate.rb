# frozen_string_literal: true

FactoryBot.define do
  factory :exchange_rate do
    sequence :date do |n|
      Date.today + n.day
    end

    rub_to_usd { 98.3 }
    rub_to_eur { 99.2 }
    rub_to_cny { 100.1 }

    trait :invalid do
      rub_to_cny { nil }
    end
  end
end
