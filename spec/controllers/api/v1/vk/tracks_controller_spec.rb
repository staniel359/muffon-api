require 'rails_helper'

RSpec.describe API::V1::VK::TracksController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if track exists' do
      VCR.use_cassette 'api/v1/vk/tracks/info/success' do
        get :info, params: { query: 'wild nothing chinatown' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :info
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'api/v1/vk/tracks/info/wrong_query' do
        get :info, params: { query: Helpers::VK::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
