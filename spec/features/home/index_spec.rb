# frozen_string_literal: true

require 'rails_helper'

feature 'Home#index', type: :feature do
  scenario 'view graph and link to table' do
    visit root_path
    expect(page).to have_css('#graph')
    expect(page).to have_link 'К таблице'
  end
end
