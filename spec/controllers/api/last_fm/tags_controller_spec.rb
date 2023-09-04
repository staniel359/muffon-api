RSpec.describe API::LastFM::TagsController do
  describe 'GET :info' do
    it 'returns 200 if tag exists' do
      VCR.use_cassette 'controllers/api/lastfm/tags/info/success' do
        get :info, params: { tag_name: 'dream pop' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :info, params: { tag_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/lastfm/tags/info/wrong_tag' do
        get :info, params: { tag_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if tag exists' do
      VCR.use_cassette 'controllers/api/lastfm/tags/description/success' do
        get :description, params: { tag_name: 'dream pop' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :description, params: { tag_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/lastfm/tags/description/wrong_tag' do
        get :description, params: { tag_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :artists' do
    it 'returns 200 if any artists' do
      VCR.use_cassette 'controllers/api/lastfm/tags/artists/success' do
        get :artists, params: { tag_name: 'dream pop' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :artists, params: { tag_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/lastfm/tags/artists/wrong_tag' do
        get :artists, params: { tag_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if any albums' do
      VCR.use_cassette 'controllers/api/lastfm/tags/albums/success' do
        get :albums, params: { tag_name: 'dream pop' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :albums, params: { tag_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/lastfm/tags/albums/wrong_tag' do
        get :albums, params: { tag_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if any tracks' do
      VCR.use_cassette 'controllers/api/lastfm/tags/tracks/success' do
        get :tracks, params: { tag_name: 'dream pop' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :tracks, params: { tag_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/lastfm/tags/tracks/wrong_tag' do
        get :tracks, params: { tag_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :similar' do
    it 'returns 200 if any similar' do
      VCR.use_cassette 'controllers/api/lastfm/tags/similar/success' do
        get :similar, params: { tag_name: 'dream pop' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :similar, params: { tag_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/lastfm/tags/similar/wrong_tag' do
        get :similar, params: { tag_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :images' do
    it 'returns 200 if any images' do
      VCR.use_cassette 'controllers/api/lastfm/tags/images/success' do
        get :images, params: { tag_name: 'dream pop' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :images, params: { tag_name: ' ' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/lastfm/tags/images/wrong_tag' do
        get :images, params: { tag_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
