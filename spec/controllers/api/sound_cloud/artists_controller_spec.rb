RSpec.describe API::SoundCloud::ArtistsController do
  describe 'GET :albums' do
    it 'returns 200 if artist present' do
      VCR.use_cassette 'controllers/api/soundcloud/artists/albums/success' do
        get :albums, params: { artist_id: '3820545' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist' do
      VCR.use_cassette 'controllers/api/soundcloud/artists/albums/wrong_id' do
        get :albums, params: { artist_id: '346758273629' }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
