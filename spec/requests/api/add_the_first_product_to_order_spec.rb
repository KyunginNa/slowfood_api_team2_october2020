# frozen_string_literal: true

RSpec.describe 'POST /api/orders', type: :request do
  let!(:product) { create(:product) }
  let!(:another_product) { create(:product, name: 'Mandu') }
  let!(:user) { create(:user) }
  let(:authorized_header) { user.create_new_auth_token }

  before do
    post '/api/orders',
         params: { product_id: product.id },
         headers: authorized_header
  end

  it 'is expected to return a 200 response status' do
    expect(response).to have_http_status 200
  end

  it 'is expected to return a success message' do
    expect(response_json['message']).to eq 'The product has been added to your order successfully.'
  end

  it 'is expected to have an "items" key with the product in it' do
    expect(response_json['items'].count).to eq 1
  end

  it 'is expected to have an id of the added product in "items"' do
    expect(response_json['items'][0]['product_id']).to eq product.id
  end
end
