RSpec.describe API::Genius::TracksController do
  describe 'GET :info' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/genius/tracks/info/success' do
        get :info, params: { track_id: '344944' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong id' do
      VCR.use_cassette 'controllers/api/genius/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/genius/tracks/description/success' do
        get :description, params: { track_id: '344944' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong id' do
      VCR.use_cassette 'controllers/api/genius/tracks/description/wrong_id' do
        get :description, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/genius/tracks/tags/success' do
        get :tags, params: { track_id: '344944' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong id' do
      VCR.use_cassette 'controllers/api/genius/tracks/tags/wrong_id' do
        get :tags, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :lyrics' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/genius/tracks/lyrics/success' do
        get :lyrics, params: { track_id: '344944' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong id' do
      VCR.use_cassette 'controllers/api/genius/tracks/lyrics/wrong_id' do
        get :lyrics, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
