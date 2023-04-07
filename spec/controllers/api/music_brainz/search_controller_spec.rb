RSpec.describe API::MusicBrainz::SearchController do
  describe 'GET :artists' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/artists/success' do
        get :artists, params: { query: 'kate bush' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :artists

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/artists/wrong_query' do
        get :artists, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/albums/success' do
        get :albums, params: { query: 'kate bush hounds of love' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :albums

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/albums/wrong_query' do
        get :albums, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :groups' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/groups/success' do
        get :groups, params: { query: 'kate bush hounds of love' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :groups

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/groups/wrong_query' do
        get :groups, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/tracks/success' do
        get :tracks, params: { query: 'kate bush hounds of love' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :tracks

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/tracks/wrong_query' do
        get :tracks, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :labels' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/labels/success' do
        get :labels, params: { query: 'polydor' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get :labels

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette 'controllers/api/musicbrainz/search/labels/wrong_query' do
        get :labels, params: { query: random }
      end

      expect(response).to have_http_status(:ok)
    end
  end
end
