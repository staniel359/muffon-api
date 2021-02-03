require 'rails_helper'

RSpec.describe API::V1::Yandex::Music::TracksController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette 'api/v1/yandex/music/tracks/info/success' do
        get :info, params: { track_id: '2203363' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong track_id' do
      VCR.use_cassette 'api/v1/yandex/music/tracks/info/wrong_id' do
        get :info, params: { track_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end