RSpec.describe API::LastFM::ArtistsController do
  describe 'GET :info' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/info/success' do
        get :info, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :info, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/info/wrong_name' do
        get :info, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :images' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/images/success' do
        get :images, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :images, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/images/wrong_name' do
        get :images, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :similar' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/similar/success' do
        get :similar, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :similar, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/similar/wrong_name' do
        get :similar, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/description/success' do
        get :description, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :description, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/description/wrong_name' do
        get :description, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/tags/success' do
        get :tags, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :tags, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/tags/wrong_name' do
        get :tags, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :listeners_count' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/listeners_count/success' do
        get :listeners_count, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :listeners_count, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/listeners_count/wrong_name' do
        get :listeners_count, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/success' do
        get :albums, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :albums, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/wrong_artist' do
        get :albums, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/tracks/success' do
        get :tracks, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :tracks, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/tracks/wrong_artist' do
        get :tracks, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :shows' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/shows/success' do
        get :shows, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :shows, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/shows/wrong_artist' do
        get :shows, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :profiles' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/profiles/success' do
        get :profiles, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :profiles, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/profiles/wrong_artist' do
        get :profiles, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'controllers/api/lastfm/artists/links/success' do
        get :links, params: { artist_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get :links, params: { artist_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/links/wrong_artist' do
        get :links, params: { artist_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
