require 'rails_helper'

RSpec.describe API::V1::Deezer::TracksController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette 'controllers/api/v1/deezer/tracks/info/success' do
        get :info, params: { track_id: '11616579' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'controllers/api/v1/deezer/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
