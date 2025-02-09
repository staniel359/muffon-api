RSpec.describe API::AmazonMusic::TracksController do
  describe 'GET :info' do
    it 'returns 200 if track present' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/info/success' do
        get :info, params: { album_id: 'B00BRRGQAI', track_id: 'B00BRRGTQ4' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/info/no_album_id' do
        get :info, params: { track_id: 'B00BRRGTQ4' }
      end

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/info/wrong_album_id' do
        get :info, params: { album_id: random, track_id: 'B00BRRGTQ4' }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/info/wrong_track_id' do
        get :info, params: { album_id: 'B00BRRGQAI', track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if track present' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/links/success' do
        get :links, params: { album_id: 'B00BRRGQAI', track_id: 'B00BRRGTQ4' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/links/no_album_id' do
        get :links, params: { track_id: 'B00BRRGTQ4' }
      end

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/links/wrong_album_id' do
        get :links, params: { album_id: random, track_id: 'B00BRRGTQ4' }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/links/wrong_track_id' do
        get :links, params: { album_id: 'B00BRRGQAI', track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if track present' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/albums/success' do
        get :albums, params: { album_id: 'B00BRRGQAI', track_id: 'B00BRRGTQ4' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no album_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/albums/no_album_id' do
        get :albums, params: { track_id: 'B00BRRGTQ4' }
      end

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/albums/wrong_album_id' do
        get :albums, params: { album_id: random, track_id: 'B00BRRGTQ4' }
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'controllers/api/amazonmusic/tracks/albums/wrong_track_id' do
        get :albums, params: { album_id: 'B00BRRGQAI', track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
