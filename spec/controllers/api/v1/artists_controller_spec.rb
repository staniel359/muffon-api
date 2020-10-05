require 'rails_helper'

RSpec.describe API::V1::ArtistsController, type: :controller do
  let(:params) { { artist_name: 'Wild Nothing' } }

  describe 'GET :show' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/info' do
        get :show, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :images' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/images' do
        get :images, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/tracks' do
        get :tracks, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :similar' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/similar' do
        get :similar, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
