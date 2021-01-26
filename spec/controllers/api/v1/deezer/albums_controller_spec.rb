require 'rails_helper'

RSpec.describe API::V1::Deezer::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'api/v1/deezer/albums/info/success' do
        get :info, params: { album_id: '1063611' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'api/v1/deezer/albums/info/wrong_id' do
        get :info, params: { album_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'api/v1/deezer/albums/tags/success' do
        get :tags, params: { album_id: '1063611' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'api/v1/deezer/albums/tags/wrong_id' do
        get :tags, params: { album_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
