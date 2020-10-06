require 'rails_helper'

RSpec.describe API::V1::SearchController, type: :controller do
  let(:params) do
    {
      artist: 'Wild Nothing',
      album: 'Gemini',
      track: 'Chinatown'
    }
  end

  describe 'GET :artists' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/search/artists' do
        get :artists, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/search/albums' do
        get :albums, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/search/tracks' do
        get :tracks, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
