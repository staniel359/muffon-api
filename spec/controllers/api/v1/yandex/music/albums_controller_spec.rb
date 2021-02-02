require 'rails_helper'

RSpec.describe API::V1::Yandex::Music::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'api/v1/yandex/music/albums/info/success' do
        get :info, params: { album_id: '288149' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong album_id' do
      VCR.use_cassette 'api/v1/yandex/music/albums/info/wrong_id' do
        get :info, params: { album_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'api/v1/yandex/music/albums/tags/success' do
        get :tags, params: { album_id: '288149' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong album_id' do
      VCR.use_cassette 'api/v1/yandex/music/albums/tags/wrong_id' do
        get :tags, params: { album_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
