require 'rails_helper'

RSpec.describe API::V1::RateYourMusic::ArtistsController, type: :controller do
  let(:random) { Helpers::Base::RANDOM_STRING }

  describe 'GET :albums' do
    it 'returns 200 if artist present' do
      VCR.use_cassette 'api/v1/rateyourmusic/artists/albums/success' do
        get :albums, params: { artist_id: '2854', album_type: 'album' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong artist' do
      VCR.use_cassette 'api/v1/rateyourmusic/artists/albums/wrong_artist' do
        get :albums, params: { artist_id: random, album_type: 'album' }
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'returns 400 if no album type' do
      VCR.use_cassette 'api/v1/rateyourmusic/artists/albums/no_album_type' do
        get :albums, params: { artist_id: '2854' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    it 'returns 400 if wrong album type' do
      VCR.use_cassette 'api/v1/rateyourmusic/artists/albums/wrong_album_type' do
        get :albums, params: { artist_id: '2854', album_type: random }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
