RSpec.describe API::VK::ArtistsController do
  describe 'GET :albums' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette(
        'controllers/api/vk/artists/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: '4333005440018923962'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist_id' do
      VCR.use_cassette(
        'controllers/api/vk/artists/albums/wrong_id'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
