RSpec.describe API::MusicBrainz::ArtistsController do
  describe 'GET :albums' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'controllers/api/musicbrainz/artists/albums/success' do
        get :albums, params: { artist_id: '4b585938-f271-45e2-b19a-91c634b5e396', album_type: 'album' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist_id' do
      VCR.use_cassette 'controllers/api/musicbrainz/artists/albums/wrong_id' do
        get :albums, params: { artist_id: random, album_type: 'album' }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 400 if no album type' do
      VCR.use_cassette 'controllers/api/musicbrainz/artists/albums/no_type' do
        get :albums, params: { artist_id: '4b585938-f271-45e2-b19a-91c634b5e396' }
      end

      expect(response).to have_http_status(:bad_request)
    end
  end
end
