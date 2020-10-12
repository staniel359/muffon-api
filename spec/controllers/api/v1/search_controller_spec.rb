require 'rails_helper'

RSpec.describe API::V1::SearchController, type: :controller do
  describe 'GET :artists' do
    it 'returns 200 if any artists' do
      VCR.use_cassette 'api/v1/search/artists/success' do
        get :artists, params: { artist: 'Wild Nothing' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no artist name' do
      get :artists, params: { artist: '' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/search/artists/wrong_name' do
        get :artists, params: { artist: Helpers::LastFM::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if any albums' do
      VCR.use_cassette 'api/v1/search/albums/success' do
        get :albums, params: { album: 'Gemini' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no album title' do
      get :albums, params: { album: '' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'api/v1/search/albums/wrong_title' do
        get :albums, params: { album: Helpers::LastFM::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if any tracks' do
      VCR.use_cassette 'api/v1/search/tracks/success' do
        get :tracks, params: { track: 'Chinatown' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no track title' do
      get :tracks, params: { track: '' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette 'api/v1/search/tracks/wrong_title' do
        get :tracks, params: { track: Helpers::LastFM::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
