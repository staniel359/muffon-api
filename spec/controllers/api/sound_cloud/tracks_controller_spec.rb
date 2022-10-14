RSpec.describe API::SoundCloud::TracksController do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette 'controllers/api/soundcloud/tracks/info/success' do
        get :info, params: { track_id: '296774474' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong track_id' do
      VCR.use_cassette 'controllers/api/soundcloud/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
