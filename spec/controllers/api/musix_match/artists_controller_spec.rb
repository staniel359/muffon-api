RSpec.describe API::MusixMatch::ArtistsController do
  describe 'GET :albums' do
    it 'returns 200 if artist_slug present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/artists/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_slug: 'Wild-Nothing',
            albums_type: 'album'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist_slug' do
      VCR.use_cassette(
        'controllers/api/musixmatch/artists/albums/wrong_slug'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_slug: random_string,
            albums_type: 'album'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
