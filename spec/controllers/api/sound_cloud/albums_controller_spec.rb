RSpec.describe API::SoundCloud::AlbumsController do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/soundcloud/albums/info/success' do
        get :info, params: { album_id: '249480404' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/soundcloud/albums/info/wrong_id' do
        get :info, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/soundcloud/albums/description/success' do
        get :description, params: { album_id: '249480404' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/soundcloud/albums/description/wrong_id' do
        get :description, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/soundcloud/albums/tags/success' do
        get :tags, params: { album_id: '249480404' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/soundcloud/albums/tags/wrong_id' do
        get :tags, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/soundcloud/albums/links/success' do
        get :links, params: { album_id: '249480404' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/soundcloud/albums/links/wrong_id' do
        get :links, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
