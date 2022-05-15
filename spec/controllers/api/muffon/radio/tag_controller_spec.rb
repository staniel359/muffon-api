RSpec.describe API::Muffon::Radio::TagController, type: :controller do
  describe 'GET :artists' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/muffon/radio/tag/artists/success' do
        get :artists, params: { tag: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :artists, params: { tag: '' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/muffon/radio/tag/artists/wrong_tag' do
        get :artists, params: { tag: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/muffon/radio/tag/tracks/success' do
        get :tracks, params: { tag: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :tracks, params: { tag: '' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/muffon/radio/tag/tracks/wrong_tag' do
        get :tracks, params: { tag: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
