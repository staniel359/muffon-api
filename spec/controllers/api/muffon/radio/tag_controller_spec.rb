RSpec.describe API::Muffon::Radio::TagController do
  describe 'GET :artists' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/muffon/radio/tag/artists/success' do
        get :artists, params: { tag_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :artists, params: { tag_name: '' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/muffon/radio/tag/artists/wrong_tag' do
        get :artists, params: { tag_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/muffon/radio/tag/tracks/success' do
        get :tracks, params: { tag_name: 'Wild Nothing' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no tag name' do
      get :tracks, params: { tag_name: '' }

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong tag name' do
      VCR.use_cassette 'controllers/api/muffon/radio/tag/tracks/wrong_tag' do
        get :tracks, params: { tag_name: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
