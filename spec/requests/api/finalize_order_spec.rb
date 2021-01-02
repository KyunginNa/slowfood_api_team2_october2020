# frozen_string_literal: true

RSpec.describe 'PUT /api/orders', type: :request do
  let(:user) { create(:user) }
  let(:authorized_header) { user.create_new_auth_token }
  let(:order) { user.orders.create }
  let(:product_1) { create(:product) }
  let(:product_2) { create(:product, name: 'Mandu', price: 80.0) }

  describe 'with finalize as params' do
    before do
      order.order_items.create(product: product_1)
      order.order_items.create(product: product_2)
      put "/api/orders/#{order.id}",
          params: { activity: 'finalize' },
          headers: authorized_header
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return success message' do
      expect(response_json['message']).to eq 'Thank you! Your order will be ready in 20 minutes.'
    end

    it 'is expected to update "finalized" attribute of the order to true' do
      expect(order.reload.finalized).to eq true
    end
  end
end