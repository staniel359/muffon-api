RSpec.describe API::LastFM::Artists::AlbumsController do
  describe 'GET :info' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/info/success' do
        get :info, params: { artist: 'Wild Nothing', album: 'Nocturne' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album title' do
      get :info, params: { artist: 'Wild Nothing', album: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/info/wrong_album' do
        get :info, params: { artist: 'Wild Nothing', album: random }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 400 if no artist name' do
      get :info, params: { artist: ' ', album: 'Nocturne' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/info/wrong_artist' do
        get :info, params: { artist: random, album: 'Nocturne' }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/description/success' do
        get :description, params: { artist: 'Wild Nothing', album: 'Nocturne' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album title' do
      get :description, params: { artist: 'Wild Nothing', album: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/description/wrong_album' do
        get :description, params: { artist: 'Wild Nothing', album: random }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 400 if no artist name' do
      get :description, params: { artist: ' ', album: 'Nocturne' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/description/wrong_artist' do
        get :description, params: { artist: random, album: 'Nocturne' }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/tags/success' do
        get :tags, params: { artist: 'Wild Nothing', album: 'Nocturne' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album title' do
      get :tags, params: { artist: 'Wild Nothing', album: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/tags/wrong_album' do
        get :tags, params: { artist: 'Wild Nothing', album: random }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 400 if no artist name' do
      get :tags, params: { artist: ' ', album: 'Nocturne' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/tags/wrong_artist' do
        get :tags, params: { artist: random, album: 'Nocturne' }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :listeners_count' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/listeners/success' do
        get :listeners_count, params: { artist: 'Wild Nothing', album: 'Nocturne' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album title' do
      get :listeners_count, params: { artist: 'Wild Nothing', album: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/listeners/wrong_album' do
        get :listeners_count, params: { artist: 'Wild Nothing', album: random }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 400 if no artist name' do
      get :listeners_count, params: { artist: ' ', album: 'Nocturne' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/listeners/wrong_artist' do
        get :listeners_count, params: { artist: random, album: 'Nocturne' }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :profiles' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/profiles/success' do
        get :profiles, params: { artist: 'Wild Nothing', album: 'Nocturne' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album title' do
      get :profiles, params: { artist: 'Wild Nothing', album: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/profiles/wrong_album' do
        get :profiles, params: { artist: 'Wild Nothing', album: random }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 400 if no artist name' do
      get :profiles, params: { artist: ' ', album: 'Nocturne' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/profiles/wrong_artist' do
        get :profiles, params: { artist: random, album: 'Nocturne' }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/links/success' do
        get :links, params: { artist: 'Wild Nothing', album: 'Nocturne' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album title' do
      get :links, params: { artist: 'Wild Nothing', album: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/links/wrong_album' do
        get :links, params: { artist: 'Wild Nothing', album: random }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 400 if no artist name' do
      get :links, params: { artist: ' ', album: 'Nocturne' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'controllers/api/lastfm/artists/albums/links/wrong_artist' do
        get :links, params: { artist: random, album: 'Nocturne' }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
