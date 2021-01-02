# frozen_string_literal: true

RSpec.describe 'POST /api/payments', type: :request do
  let(:user) { create(:user) }
  let(:authorized_header) { user.create_new_auth_token }
  let(:order) { user.orders.create }
  let!(:product) { create(:product) }

  describe 'with pay as params' do
    before do
      order.order_items.create(product: product)
      order.update_attribute(:finalized, true)
      post '/api/payments',
           params: { order_id: order.id,
                     stripeToken: StripeMock.create_test_helper.generate_card_token },
           headers: authorized_header
    end
    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end
    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'Thank you! Your order will be ready in 20 minutes.'
    end
    it 'is expected to update "paid" attribute of the order to true' do
      expect(order.reload.paid).to eq true
    end
  end
end
