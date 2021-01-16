require 'rails_helper'

RSpec.describe API::V1::Bandcamp::SearchController, type: :controller do
  describe 'GET :albums' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/bandcamp/search/albums/success' do
        get :albums, params: { query: 'wild nothing nocturne' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :albums
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'api/v1/bandcamp/search/albums/wrong_query' do
        get :albums, params: { query: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/bandcamp/search/tracks/success' do
        get :tracks, params: { query: 'wild nothing nocturne' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :tracks
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'api/v1/bandcamp/search/tracks/wrong_query' do
        get :tracks, params: { query: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
