RSpec.describe API::MusixMatch::TracksController do
  describe 'GET :info' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/info/success' do
        get :info, params: { track_id: '6717709' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/tags/success' do
        get :tags, params: { track_id: '6717709' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/tags/wrong_id' do
        get :tags, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :lyrics' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/lyrics/success' do
        get :lyrics, params: { track_id: '6717709' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/lyrics/wrong_id' do
        get :lyrics, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/links/success' do
        get :links, params: { track_id: '6717709' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/links/wrong_id' do
        get :links, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/albums/success' do
        get :albums, params: { track_id: '6717709' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette 'controllers/api/musixmatch/tracks/albums/wrong_id' do
        get :albums, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
