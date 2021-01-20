require 'rails_helper'

RSpec.describe API::V1::Spotify::ArtistsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'api/v1/spotify/artists/info/success' do
        get :info, params: { artist_id: '1aSxMhuvixZ8h9dK9jIDwL' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong artist_id' do
      VCR.use_cassette 'api/v1/spotify/artists/info/wrong_id' do
        get :info, params: { artist_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'api/v1/spotify/artists/albums/success' do
        get :albums, params: { artist_id: '1aSxMhuvixZ8h9dK9jIDwL' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong artist_id' do
      VCR.use_cassette 'api/v1/spotify/artists/albums/wrong_id' do
        get :albums, params: { artist_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'GET :top_tracks' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'api/v1/spotify/artists/top_tracks/success' do
        get :top_tracks, params: { artist_id: '1aSxMhuvixZ8h9dK9jIDwL' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong artist_id' do
      VCR.use_cassette 'api/v1/spotify/artists/top_tracks/wrong_id' do
        get :top_tracks, params: { artist_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe 'GET :similar' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'api/v1/spotify/artists/similar/success' do
        get :similar, params: { artist_id: '1aSxMhuvixZ8h9dK9jIDwL' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong artist_id' do
      VCR.use_cassette 'api/v1/spotify/artists/similar/wrong_id' do
        get :similar, params: { artist_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
