RSpec.describe API::Bandcamp::ArtistsController do
  describe 'GET :albums' do
    it 'returns 200 if artist present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: '2228040235'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/wrong_artist'
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
