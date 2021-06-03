require 'rails_helper'

RSpec.describe API::V1::LastFM::TopController, type: :controller do
  describe 'GET :artists' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/v1/lastfm/top/artists/success' do
        get :artists
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/v1/lastfm/top/tracks/success' do
        get :tracks
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :tags' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/v1/lastfm/top/tags/success' do
        get :tags
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
