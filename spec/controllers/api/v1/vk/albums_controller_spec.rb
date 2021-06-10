RSpec.describe API::V1::VK::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album exists' do
      VCR.use_cassette 'controllers/api/v1/vk/albums/info/success' do
        get :info, params: { album_id: '1018186', owner_id: '-2000018186', access_hash: '4b0d541e5c641772e4' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/v1/vk/albums/info/wrong_id' do
        get :info, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
