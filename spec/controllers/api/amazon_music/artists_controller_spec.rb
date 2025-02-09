RSpec.describe API::AmazonMusic::ArtistsController do
  describe 'GET :albums' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'controllers/api/amazonmusic/artists/albums/success' do
        get :albums, params: { artist_id: 'B002ZXIYRG' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/artists/albums/wrong_id' do
        get :albums, params: { artist_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
