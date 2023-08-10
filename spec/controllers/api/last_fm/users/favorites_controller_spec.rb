RSpec.describe API::LastFM::Users::FavoritesController do
  describe 'GET :tracks' do
    it 'returns 200 if user exists' do
      VCR.use_cassette 'controllers/api/lastfm/users/favorites/tracks/success' do
        get :tracks, params: { nickname: 'cornwell_93', profile_id: 1, page: 2, limit: 5 }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no user name' do
      get :tracks, params: { nickname: '', profile_id: 1 }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong user name' do
      VCR.use_cassette 'controllers/api/lastfm/users/favorites/tracks/wrong_nickname' do
        get :tracks, params: { nickname: random, profile_id: 1 }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
