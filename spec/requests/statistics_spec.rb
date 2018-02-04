require 'rails_helper'

RSpec.describe 'API Statistics', type: :request do
  describe 'POST /api/statistics' do
    describe 'authorization' do
      context 'when invalid token' do
        let(:headers) { { access_token: 'wrong' } }
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