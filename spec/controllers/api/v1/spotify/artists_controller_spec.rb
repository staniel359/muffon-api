RSpec.describe API::V1::Spotify::ArtistsController, type: :controller do
  describe 'GET :albums' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'controllers/api/v1/spotify/artists/albums/success' do
        get :albums, params: { artist_id: '1aSxMhuvixZ8h9dK9jIDwL', album_type: 'album' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong artist_id' do
      VCR.use_cassette 'controllers/api/v1/spotify/artists/albums/wrong_id' do
        get :albums, params: { artist_id: random, album_type: 'album' }
      end

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 400 if no album type' do
      VCR.use_cassette 'controllers/api/v1/spotify/artists/albums/no_type' do
        get :albums, params: { artist_id: '1aSxMhuvixZ8h9dK9jIDwL' }
      end

      expect(response).to have_http_status(:bad_request)
    end
  end
end
