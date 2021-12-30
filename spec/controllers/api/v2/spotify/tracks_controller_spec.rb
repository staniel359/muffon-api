RSpec.describe API::V2::Spotify::TracksController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette 'controllers/api/v2/spotify/tracks/info/success' do
        get :info, params: { track_id: '29d0nY7TzCoi22XBqDQkiP' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong track_id' do
      VCR.use_cassette 'controllers/api/v2/spotify/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:bad_request)
    end
  end
end
