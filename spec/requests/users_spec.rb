require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end

  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers}

      it 'should create a new user' do
        expect(response).to have_http_status(201)
      end

      it 'should return a success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

    end
  end

end