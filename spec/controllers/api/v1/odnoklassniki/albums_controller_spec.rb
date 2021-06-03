require 'rails_helper'

RSpec.describe API::V1::Odnoklassniki::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/v1/odnoklassniki/albums/info/success' do
        get :info, params: { album_id: '122909892023105' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong album_id' do
      VCR.use_cassette 'controllers/api/v1/odnoklassniki/albums/info/wrong_id' do
        get :info, params: { album_id: random }
      end

      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/v1/odnoklassniki/albums/tags/success' do
        get :tags, params: { album_id: '122909892023105' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong album_id' do
      VCR.use_cassette 'controllers/api/v1/odnoklassniki/albums/tags/wrong_id' do
        get :tags, params: { album_id: random }
      end

      expect(response).to have_http_status(:bad_request)
    end
  end
end
