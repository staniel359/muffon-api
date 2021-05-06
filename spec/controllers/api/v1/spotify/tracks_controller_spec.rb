require 'rails_helper'

RSpec.describe API::V1::Spotify::TracksController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette 'api/v1/spotify/tracks/info/success' do
        get :info, params: { track_id: '29d0nY7TzCoi22XBqDQkiP' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong track_id' do
      VCR.use_cassette 'api/v1/spotify/tracks/info/wrong_id' do
        get :info, params: { track_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
