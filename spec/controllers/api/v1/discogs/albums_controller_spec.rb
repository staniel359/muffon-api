RSpec.describe API::V1::Discogs::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/v1/discogs/albums/info/success' do
        get :info, params: { album_id: '16233996' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/v1/discogs/albums/info/wrong_id' do
        get :info, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/v1/discogs/albums/description/success' do
        get :description, params: { album_id: '16233996' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/v1/discogs/albums/description/wrong_id' do
        get :description, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'controllers/api/v1/discogs/albums/tags/success' do
        get :tags, params: { album_id: '16233996' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette 'controllers/api/v1/discogs/albums/tags/wrong_id' do
        get :tags, params: { album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
