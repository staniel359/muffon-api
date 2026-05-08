RSpec.describe API::Spotify::Users::PlaylistsController do
  describe 'GET :index' do
    it 'returns 200 if user exists' do
      VCR.use_cassette(
        'controllers/api/spotify/users/playlists/index/success'
      ) do
        get(
          :index,
          params: {
            **required_params,
            page: '2',
            limit: '5',
            profile_id: '1'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if user exists' do
      VCR.use_cassette(
        'controllers/api/spotify/users/playlists/tracks/success'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            playlist_id: '5RDmNvuz0prl7bLqtZNkDe',
            page: '2',
            limit: '5',
            profile_id: '1'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end
end
