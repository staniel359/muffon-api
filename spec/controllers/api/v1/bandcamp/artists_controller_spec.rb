require 'rails_helper'

RSpec.describe API::V1::Bandcamp::ArtistsController, type: :controller do
  describe 'GET :albums' do
    it 'returns 200 if artist present' do
      VCR.use_cassette 'api/v1/bandcamp/artists/albums/success' do
        get :albums, params: { artist_id: '2228040235' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist' do
      VCR.use_cassette 'api/v1/bandcamp/artists/albums/wrong_artist' do
        get :albums, params: { artist_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
