RSpec.describe API::RateYourMusic::SearchController, type: :controller do
  describe 'GET :artists' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/rateyourmusic/search/artists/success' do
        get :artists, params: { query: 'a' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :artists

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 200 if wrong query' do
      VCR.use_cassette 'controllers/api/rateyourmusic/search/artists/wrong_query' do
        get :artists, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/rateyourmusic/search/albums/success' do
        get :albums, params: { query: 'a' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :albums

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 200 if wrong query' do
      VCR.use_cassette 'controllers/api/rateyourmusic/search/albums/wrong_query' do
        get :albums, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :albums_various' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/rateyourmusic/search/albums_various/success' do
        get :albums_various, params: { query: 'a' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :albums_various

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 200 if wrong query' do
      VCR.use_cassette 'controllers/api/rateyourmusic/search/albums_various/wrong_query' do
        get :albums_various, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :labels' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/rateyourmusic/search/labels/success' do
        get :labels, params: { query: 'a' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :labels

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 200 if wrong query' do
      VCR.use_cassette 'controllers/api/rateyourmusic/search/labels/wrong_query' do
        get :labels, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end
end
