RSpec.describe API::YouTube::SearchController, type: :controller do
  describe 'GET :videos' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/youtube/search/videos/success' do
        get :videos, params: { query: 'wild nothing chinatown' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :videos

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/youtube/search/videos/wrong_query' do
        get :videos, params: { query: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
