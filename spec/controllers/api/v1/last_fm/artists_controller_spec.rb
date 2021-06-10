RSpec.describe API::V1::LastFM::ArtistsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/info/success' do
        get :info, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :info, params: { artist: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/info/wrong_name' do
        get :info, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :images' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/images/success' do
        get :images, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :images, params: { artist: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/images/wrong_name' do
        get :images, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :similar' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/similar/success' do
        get :similar, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :similar, params: { artist: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/similar/wrong_name' do
        get :similar, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/description/success' do
        get :description, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :description, params: { artist: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/description/wrong_name' do
        get :description, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/tags/success' do
        get :tags, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :tags, params: { artist: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/tags/wrong_name' do
        get :tags, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :listeners_count' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/listeners_count/success' do
        get :listeners_count, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :listeners_count, params: { artist: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/listeners_count/wrong_name' do
        get :listeners_count, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/albums/success' do
        get :albums, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :albums, params: { artist: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/albums/wrong_artist' do
        get :albums, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/tracks/success' do
        get :tracks, params: { artist: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :tracks, params: { artist: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/v1/lastfm/artists/tracks/wrong_artist' do
        get :tracks, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
