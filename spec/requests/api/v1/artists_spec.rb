require 'rails_helper'

RSpec.describe 'API::V1::Artists', type: :request do
  describe 'GET :show' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/show' do
        get artist_path(artist_name: 'Wild Nothing')
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :images' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/images' do
        get images_artist_path(artist_name: 'Wild Nothing')
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/tracks' do
        get artist_path(artist_name: 'Wild Nothing')
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/albums' do
        get artist_path(artist_name: 'Wild Nothing')
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :similar' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/similar' do
        get artist_path(artist_name: 'Wild Nothing')
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
