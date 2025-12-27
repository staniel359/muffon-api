RSpec.describe API::LastFM::Users::PlaylistsController do
  describe 'GET :index' do
    it 'returns 200 if user exists' do
      VCR.use_cassette(
        'controllers/api/lastfm/users/playlists/success'
      ) do
        get(
          :index,
          params: {
            **required_params,
            nickname: 'cornwell_93',
            profile_id: '1'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong user name' do
      VCR.use_cassette(
        'controllers/api/lastfm/users/playlists/wrong_nickname'
      ) do
        get(
          :index,
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
