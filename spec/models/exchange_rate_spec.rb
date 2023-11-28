# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  let(:exchange_rate) { create(:exchange_rate) }
  let(:exchange_rate_invalid) { build(:exchange_rate, :invalid) }

  it 'factory should be valid' do
    expect(exchange_rate).to be_valid
  end

  it 'invalid factory' do
    expect(exchange_rate_invalid).to_not be_valid
  end

  describe 'validations' do
    it { should validate_presence_of :date }
    it { should validate_presence_of :rub_to_usd }
    it { should validate_presence_of :rub_to_eur }
    it { should validate_presence_of :rub_to_cny }
  end

  describe 'database' do
    it { should have_db_index(:date) }
    it { should have_db_column(:date).of_type(:date).with_options(null: false) }
    it { should have_db_column(:rub_to_usd).of_type(:decimal) }
    it { should have_db_column(:rub_to_eur).of_type(:decimal) }
    it { should have_db_column(:rub_to_eur).of_type(:decimal) }
  end
end
