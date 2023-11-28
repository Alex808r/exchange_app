# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'table', to: 'home#table', as: 'table'
end
