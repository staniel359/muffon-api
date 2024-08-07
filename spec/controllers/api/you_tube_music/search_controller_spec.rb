RSpec.describe API::YouTubeMusic::SearchController do
  describe 'GET :tracks' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/youtubemusic/search/tracks/success' do
        get :tracks, params: { query: 'wild nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :tracks

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/youtubemusic/search/tracks/wrong_query' do
        get :tracks, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :videos' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/youtubemusic/search/videos/success' do
        get :videos, params: { query: 'wild nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :videos

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/youtubemusic/search/videos/wrong_query' do
        get :videos, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :mixes' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/youtubemusic/search/mixes/success' do
        get :mixes, params: { query: '80s' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :mixes

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/youtubemusic/search/mixes/wrong_query' do
        get :mixes, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :playlists' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/youtubemusic/search/playlists/success' do
        get :playlists, params: { query: '80s' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :playlists

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/youtubemusic/search/playlists/wrong_query' do
        get :playlists, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end
end
