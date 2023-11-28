# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:exchange_rates) { create_list(:exchange_rate, 28) }
  describe 'GET #index' do
    before { get :index }

    it 'assigns graph_data' do
      exchange_rates = create_list(:exchange_rate, 28)
      graph_data = double('graph_data')
      allow(ExchangeGraphService).to receive(:execute).with(exchange_rates).and_return(graph_data)

      get :index

      expect(assigns(:graph_data)).to eq(graph_data)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end
end
