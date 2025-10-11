RSpec.describe API::Deezer::ArtistsController do
  describe 'GET :albums' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette(
        'controllers/api/deezer/artists/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: '1049',
            album_type: 'album'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album_type' do
      VCR.use_cassette(
        'controllers/api/deezer/artists/albums/no_album_type'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: '1049'
          }
        )
      end

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist_id' do
      VCR.use_cassette(
        'controllers/api/deezer/artists/albums/wrong_id'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: random_string,
            album_type: 'album'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
