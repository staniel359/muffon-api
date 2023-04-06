RSpec.describe API::YouTube::SearchController do
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

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :channels' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/youtube/search/channels/success' do
        get :channels, params: { query: 'kexp' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :channels

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/youtube/search/channels/wrong_query' do
        get :channels, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :playlists' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/youtube/search/playlists/success' do
        get :playlists, params: { query: '80s' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :playlists

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/youtube/search/playlists/wrong_query' do
        get :playlists, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end
end
