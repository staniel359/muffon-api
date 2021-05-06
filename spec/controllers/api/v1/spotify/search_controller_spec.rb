require 'rails_helper'

RSpec.describe API::V1::Spotify::SearchController, type: :controller do
  describe 'GET :artists' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/spotify/search/artists/success' do
        get :artists, params: { query: 'kate bush' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :artists
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'api/v1/spotify/search/artists/wrong_query' do
        get :artists, params: { query: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/spotify/search/albums/success' do
        get :albums, params: { query: 'kate bush' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :albums
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'api/v1/spotify/search/albums/wrong_query' do
        get :albums, params: { query: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/spotify/search/tracks/success' do
        get :tracks, params: { query: 'kate bush' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :tracks
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'api/v1/spotify/search/tracks/wrong_query' do
        get :tracks, params: { query: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
