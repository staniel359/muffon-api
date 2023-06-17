RSpec.describe API::LastFM::UsersController do
  describe 'GET :info' do
    it 'returns 200 if user exists' do
      VCR.use_cassette 'controllers/api/lastfm/users/info/success' do
        get :info, params: { nickname: 'cornwell_93', profile_id: 1 }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no user nickname' do
      get :info, params: { nickname: '', profile_id: 1 }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong user name' do
      VCR.use_cassette 'controllers/api/lastfm/users/info/wrong_nickname' do
        get :info, params: { nickname: random, profile_id: 1 }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :plays' do
    it 'returns 200 if user exists' do
      VCR.use_cassette 'controllers/api/lastfm/users/plays/success' do
        get :plays, params: { nickname: 'cornwell_93', profile_id: 1, page: 2, limit: 5 }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no user name' do
      get :plays, params: { nickname: '', profile_id: 1 }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong user name' do
      VCR.use_cassette 'controllers/api/lastfm/users/plays/wrong_nickname' do
        get :plays, params: { nickname: random, profile_id: 1 }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
