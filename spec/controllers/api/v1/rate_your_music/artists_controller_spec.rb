require 'rails_helper'

RSpec.describe API::V1::RateYourMusic::ArtistsController, type: :controller do
  describe 'GET :albums' do
    it 'returns 200 if artist present' do
      VCR.use_cassette 'controllers/api/v1/rateyourmusic/artists/albums/success' do
        get :albums, params: { artist_id: '2854', album_type: 'album' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist' do
      VCR.use_cassette 'controllers/api/v1/rateyourmusic/artists/albums/wrong_artist' do
        get :albums, params: { artist_id: random, album_type: 'album' }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 400 if no album type' do
      VCR.use_cassette 'controllers/api/v1/rateyourmusic/artists/albums/no_album_type' do
        get :albums, params: { artist_id: '2854' }
      end

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 400 if wrong album type' do
      VCR.use_cassette 'controllers/api/v1/rateyourmusic/artists/albums/wrong_album_type' do
        get :albums, params: { artist_id: '2854', album_type: random }
      end

      expect(response).to have_http_status(:bad_request)
    end
  end
end
