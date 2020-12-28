require 'rails_helper'

RSpec.describe API::V1::VK::TracksController, type: :controller do
  describe 'GET :info' do
    let(:track_id) do
      '371745457_456339911_eb5f8906faa447eca3_d8bb3376116d501f9d'
    end

    it 'returns 200 if track exists' do
      VCR.use_cassette 'api/v1/vk/tracks/info/success' do
        get :info, params: { track_id: track_id }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'api/v1/vk/tracks/info/wrong_id' do
        get :info, params: { track_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
