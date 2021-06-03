require 'rails_helper'

RSpec.describe API::V1::YandexMusic::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/v1/yandexmusic/albums/info/success' do
        get :info, params: { album_id: '288149' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong album_id' do
      VCR.use_cassette 'controllers/api/v1/yandexmusic/albums/info/wrong_id' do
        get :info, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/v1/yandexmusic/albums/tags/success' do
        get :tags, params: { album_id: '288149' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong album_id' do
      VCR.use_cassette 'controllers/api/v1/yandexmusic/albums/tags/wrong_id' do
        get :tags, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
