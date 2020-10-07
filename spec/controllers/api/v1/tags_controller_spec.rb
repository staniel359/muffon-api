require 'rails_helper'

RSpec.describe API::V1::TagsController, type: :controller do
  let(:params) { { tag: 'dream pop' } }

  describe 'GET :artists' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/tags/artists' do
        get :artists, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/tags/albums' do
        get :albums, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/tags/tracks' do
        get :tracks, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
