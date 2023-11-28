# frozen_string_literal: true

require 'rails_helper'

feature 'Home#table', type: :feature do
  scenario 'view table and link to graph' do
    visit table_path
    expect(page).to have_link 'График'
    expect(page).to have_content 'Курс за последние 4 недели'
    expect(page).to have_selector('table')
    within('table') do
      expect(page).to have_content('Валюта')
      expect(page).to have_content('4 недели назад')
      expect(page).to have_content('3 недели назад')
      expect(page).to have_content('позапрошлая неделя')
      expect(page).to have_content('прошлая неделя')
      expect(page).to have_content('USD')
      expect(page).to have_content('EUR')
      expect(page).to have_content('CNY')
    end
  end
end
