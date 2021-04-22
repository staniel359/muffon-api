require 'rails_helper'

RSpec.describe API::V1::YouTube::SearchController, type: :controller do
  describe 'GET :videos' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/youtube/search/videos/success' do
        get :videos, params: { query: 'wild nothing chinatown' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :videos
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'api/v1/youtube/search/videos/wrong_query' do
        get :videos, params: { query: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
