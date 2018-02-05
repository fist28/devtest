require 'rails_helper'

RSpec.describe 'API Statistics', type: :request do
  describe 'POST /api/statistics' do
    describe 'authorization' do
      context 'when valid token' do
        let(:headers) { { 'access-token' => Rails.application.secrets.api_access_token } }
        let(:params) {{}}
        before { post '/api/statistics', params: fixture('statistics'), headers: headers  }
        it 'has access' do
          expect(response).to_not have_http_status(403)
        end
      end

      context 'when invalid token' do
        let(:headers) { { 'access-token' => 'wrong' } }
        let(:params) { {} }
        before { post '/api/statistics', params: params, headers: headers }

        it 'return 403 code' do
          expect(response).to have_http_status(403)
        end

        it 'return invalid token message' do
          expect(json['error']).to match('authentication error')
        end
      end
    end
  end
end
