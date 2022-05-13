RSpec.describe API::V2::LastFM::UsersController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if user exists' do
      VCR.use_cassette 'controllers/api/v2/lastfm/users/info/success' do
        get :info, params: { nickname: 'cornwell_93' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no user nickname' do
      get :info, params: { nickname: '' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong user name' do
      VCR.use_cassette 'controllers/api/v2/lastfm/users/info/wrong_nickname' do
        get :info, params: { nickname: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :plays' do
    it 'returns 200 if user exists' do
      VCR.use_cassette 'controllers/api/v2/lastfm/users/plays/success' do
        get :plays, params: { nickname: 'cornwell_93', page: 2, limit: 5 }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no user name' do
      get :plays, params: { nickname: '' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong user name' do
      VCR.use_cassette 'controllers/api/v2/lastfm/users/plays/wrong_nickname' do
        get :plays, params: { nickname: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
