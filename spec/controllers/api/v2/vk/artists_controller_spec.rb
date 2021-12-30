RSpec.describe API::V2::VK::ArtistsController, type: :controller do
  describe 'GET :albums' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/v2/vk/artists/albums/success' do
        get :albums, params: { artist_id: '4333005440018923962' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist_id' do
      VCR.use_cassette 'controllers/api/v2/vk/artists/albums/wrong_id' do
        get :albums, params: { artist_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
