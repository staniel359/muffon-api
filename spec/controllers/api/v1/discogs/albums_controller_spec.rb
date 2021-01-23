require 'rails_helper'

RSpec.describe API::V1::Discogs::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'api/v1/discogs/albums/info/success' do
        get :info, params: { album_id: '16233996' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'api/v1/discogs/albums/info/wrong_id' do
        get :info, params: { album_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :description' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'api/v1/discogs/albums/description/success' do
        get :description, params: { album_id: '16233996' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'api/v1/discogs/albums/description/wrong_id' do
        get :description, params: { album_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
