require 'rails_helper'

RSpec.describe API::V1::YouTubeController, type: :controller do
  describe 'GET :search' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/youtube/search/success' do
        get :search, params: { query: 'wild nothing chinatown' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :search
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'api/v1/youtube/search/wrong_query' do
        get :search, params: { query: Helpers::YouTube::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
