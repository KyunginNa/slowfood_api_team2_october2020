# frozen_string_literal: true

RSpec.describe Api::ProductsController, type: :request do
  let!(:product) do
    3.times { create(:product) }
  end

  describe 'GET /api/product' do
    before do
      get '/api/product'
    end

    it 'is expected to return a 200 status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a collection of products' do
      
      binding.pry
      
    end
  end
end
