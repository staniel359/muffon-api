require 'rails_helper'

RSpec.describe API::V1::Genius::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'api/v1/genius/albums/info/success' do
        get :info, params: { album_id: '168168' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong id' do
      VCR.use_cassette 'api/v1/genius/albums/info/wrong_id' do
        get :info, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'api/v1/genius/albums/description/success' do
        get :description, params: { album_id: '168168' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong id' do
      VCR.use_cassette 'api/v1/genius/albums/description/wrong_id' do
        get :description, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
