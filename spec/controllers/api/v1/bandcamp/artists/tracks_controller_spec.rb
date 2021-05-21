require 'rails_helper'

RSpec.describe API::V1::Bandcamp::Artists::TracksController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if track present' do
      VCR.use_cassette 'api/v1/bandcamp/artists/tracks/info/success' do
        get :info, params: { artist_id: '2228040235', track_id: '2723372494' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette 'api/v1/bandcamp/artists/tracks/info/wrong_track' do
        get :info, params: { artist_id: '2228040235', track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if track present' do
      VCR.use_cassette 'api/v1/bandcamp/artists/tracks/description/success' do
        get :description, params: { artist_id: '2228040235', track_id: '2723372494' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette 'api/v1/bandcamp/artists/tracks/description/wrong_track' do
        get :description, params: { artist_id: '2228040235', track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if track present' do
      VCR.use_cassette 'api/v1/bandcamp/artists/tracks/tags/success' do
        get :tags, params: { artist_id: '2228040235', track_id: '2723372494' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette 'api/v1/bandcamp/artists/tracks/tags/wrong_track' do
        get :tags, params: { artist_id: '2228040235', track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
