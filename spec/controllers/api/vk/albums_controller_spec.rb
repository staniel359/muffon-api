RSpec.describe API::VK::AlbumsController do
  describe 'GET :info' do
    it 'returns 200 if album exists' do
      VCR.use_cassette 'controllers/api/vk/albums/info/success' do
        get :info, params: { album_id: '3885619', owner_id: '-2000885619', access_key: '154554fc908e1e4c72' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/vk/albums/info/wrong_id' do
        get :info, params: { album_id: random, owner_id: '-2000885619', access_key: '154554fc908e1e4c72' }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if album exists' do
      VCR.use_cassette 'controllers/api/vk/albums/links/success' do
        get :links, params: { album_id: '3885619', owner_id: '-2000885619', access_key: '154554fc908e1e4c72' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/vk/albums/links/wrong_id' do
        get :links, params: { album_id: random, owner_id: '-2000885619', access_key: '154554fc908e1e4c72' }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
