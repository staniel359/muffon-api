require 'rails_helper'

RSpec.describe API::V1::Discogs::ArtistsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'api/v1/discogs/artist/info/success' do
        get :info, params: { artist_id: '85929' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong artist_id' do
      VCR.use_cassette 'api/v1/discogs/artist/info/wrong_id' do
        get :info, params: { artist_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'api/v1/discogs/artist/albums/success' do
        get :albums, params: { artist_id: '85929' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong artist_id' do
      VCR.use_cassette 'api/v1/discogs/artist/albums/wrong_id' do
        get :albums, params: { artist_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
