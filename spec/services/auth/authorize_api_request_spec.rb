require 'rails_helper'

RSpec.describe Auth::AuthorizeApiRequest do
  describe '#call' do
    let(:service) { described_class.new(params, header) }
    let(:correct_token) { Rails.application.secrets.api_access_token }
    context 'with access token in params' do
      let(:header) { {} }
      context 'when token is correct' do
        let(:params) { { access_token: correct_token } }

        it 'allow access to resource' do
          expect(service.call).to eq true
        end
      end

      context 'when token is incorrect' do
        let(:params) { { access_token: :incorrect_token } }

        it 'railse error InvalidToken' do
          expect(service.call).to be false
        end
      end
    end

    context 'with access token in headers' do
      let(:params) { {} }
      context 'when token is correct' do
        let(:header) { {access_token: correct_token } }

        it 'allow access to resource' do
          expect(service.call).to eq true
        end
      end

      context 'when token is incorrect' do
        let(:header) { { access_token: :incorrect_token } }

        it 'railse error InvalidToken' do
          expect(service.call).to be false
        end
      end
    end
  end
end
