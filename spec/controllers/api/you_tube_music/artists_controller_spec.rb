RSpec.describe API::YouTubeMusic::ArtistsController do
  describe 'GET :albums' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/artists/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: 'UC9UhWlkLfeypFt7pp7v_aBw',
            albums_type: 'album'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist_id' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/artists/albums/wrong_id'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: random_string,
            albums_type: 'album'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 400 if no albums_type' do
      get(
        :albums,
        params: {
          **required_params,
          artist_id: 'UC9UhWlkLfeypFt7pp7v_aBw'
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 400 if wrong albums_type' do
      get(
        :albums,
        params: {
          **required_params,
          artist_id: 'UC9UhWlkLfeypFt7pp7v_aBw',
          albums_type: random_string
        }
      )

      expect(response).to have_http_status(:bad_request)
    end
  end
end
