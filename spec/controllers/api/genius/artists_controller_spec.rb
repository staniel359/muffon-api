RSpec.describe API::Genius::ArtistsController, type: :controller do
  describe 'GET :albums' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/genius/artists/albums/success' do
        get :albums, params: { artist_id: '3490' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong id' do
      VCR.use_cassette 'controllers/api/genius/artists/albums/wrong_id' do
        get :albums, params: { artist_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
