require 'rails_helper'

RSpec.describe API::V1::Odnoklassniki::TracksController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette 'api/v1/odnoklassniki/tracks/info/success' do
        get :info, params: { track_id: '123042442621275' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong track_id' do
      VCR.use_cassette 'api/v1/odnoklassniki/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:bad_request)
    end
  end
end
