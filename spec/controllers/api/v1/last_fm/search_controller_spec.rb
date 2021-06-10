RSpec.describe API::V1::LastFM::SearchController, type: :controller do
  describe 'GET :artists' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/v1/lastfm/search/artists/success' do
        get :artists, params: { query: 'wild nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :artists

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/v1/lastfm/search/artists/wrong_query' do
        get :artists, params: { query: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/v1/lastfm/search/albums/success' do
        get :albums, params: { query: 'wild nothing gemini' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :albums

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/v1/lastfm/search/albums/wrong_query' do
        get :albums, params: { query: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/v1/lastfm/search/tracks/success' do
        get :tracks, params: { query: 'wild nothing chinatown' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :tracks

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/v1/lastfm/search/tracks/wrong_query' do
        get :tracks, params: { query: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/v1/lastfm/search/tags/success' do
        get :tags, params: { query: 'pop' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :tags

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/v1/lastfm/search/tags/wrong_query' do
        get :tags, params: { query: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
