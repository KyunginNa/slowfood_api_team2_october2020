# frozen_string_literal: true

RSpec.describe Api::ProductsController, type: :request do
  let!(:product) do
    3.times { create(:product) }
  end

  describe 'GET /api/products' do
    before do
      get '/api/products'
    end

    it 'is expected to return a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return three products' do
      expect(response_json['products'].count).to eq 3
    end
  end
end
