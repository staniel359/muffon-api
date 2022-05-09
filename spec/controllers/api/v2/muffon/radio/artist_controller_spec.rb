RSpec.describe API::V2::Muffon::Radio::ArtistController, type: :controller do
  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/v2/muffon/radio/artist/tracks/success' do
        get :tracks, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :tracks, params: { artist: '' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v2/muffon/radio/artist/tracks/wrong_artist' do
        get :tracks, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :similar' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/v2/muffon/radio/artist/similar/success' do
        get :similar, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :similar, params: { artist: '' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v2/muffon/radio/artist/similar/wrong_artist' do
        get :similar, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
