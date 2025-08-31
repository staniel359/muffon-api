RSpec.describe API::MusixMatch::ArtistsController do
  describe 'GET :albums' do
    it 'returns 200 if id present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/artists/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: '542702'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette(
        'controllers/api/musixmatch/artists/albums/wrong_id'
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
