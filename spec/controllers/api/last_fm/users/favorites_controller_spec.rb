RSpec.describe API::LastFM::Users::FavoritesController do
  describe 'GET :tracks' do
    it 'returns 200 if user exists' do
      VCR.use_cassette(
        'controllers/api/lastfm/users/favorites/tracks/success'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            nickname: 'cornwell_93',
            page: '2',
            limit: '5',
            profile_id: '1'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong user name' do
      VCR.use_cassette(
        'controllers/api/lastfm/users/favorites/tracks/wrong_nickname'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            nickname: random_string,
            profile_id: '1'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
