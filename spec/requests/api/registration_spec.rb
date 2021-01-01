# frozen_string_literal: true

RSpec.describe 'POST /api/auth', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  describe 'with valid credentials' do
    before do
      post '/api/auth',
           params: {
             email: 'test@test.com',
             password: 'password',
             password_confirmation: 'password'
           },
           headers: headers
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a success message' do
      expect(response_json['status']).to eq 'success'
    end
  end

  describe 'with a non-matching password confirmation' do
    before do
      post '/api/auth',
           params: {
             email: 'test@test.com',
             password: 'password',
             password_confirmation: 'wrong_password'
           },
           headers: headers
    end

    it 'is expected to return a 422 response status' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return an error message' do
      expect(response_json['errors']['full_messages']).to include("Password confirmation doesn't match Password")
    end
  end

  describe 'with an invalid email' do
    before do
      post '/api/auth',
           params: {
             email: 'test@test',
             password: 'password',
             password_confirmation: 'password'
           },
           headers: headers
    end

    it 'is expected to return a 422 response status' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return an error message' do
      expect(response_json['errors']['full_messages']).to include('Email is not an email')
    end
  end
end
