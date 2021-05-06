require 'rails_helper'

RSpec.describe API::V1::Genius::SearchController, type: :controller do
  describe 'GET :tracks' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/genius/search/tracks/success' do
        get :tracks, params: { query: 'molly nilsson' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :tracks

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'api/v1/genius/search/tracks/wrong_query' do
        get :tracks, params: { query: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
