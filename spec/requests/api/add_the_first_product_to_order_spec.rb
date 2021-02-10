# frozen_string_literal: true

RSpec.describe 'POST /api/orders', type: :request do
  let!(:product) { create(:product) }
  let!(:another_product) { create(:product, name: 'Mandu') }
  let!(:user) { create(:user) }
  let(:authorized_header) { user.create_new_auth_token }

  describe 'with valid product id' do
    before do
      post '/api/orders',
           params: { product_id: product.id },
           headers: authorized_header
    end

    it 'is expected to return a 201 response status' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'The product has been added to your order successfully.'
    end

    it 'is expected to respond with order id' do
      order = Order.last      
      expect(response_json['order']['id']).to eq order.id
    end

    it 'is expected to respond with right amount of products' do
      expect(response_json['order']['products'].count).to eq 1
    end

    it 'is expected to respond with right total price of products' do
      expect(response_json['order']['total']).to eq 12500
    end
  end
end
