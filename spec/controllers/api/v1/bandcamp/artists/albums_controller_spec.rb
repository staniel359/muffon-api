RSpec.describe API::V1::Bandcamp::Artists::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album present' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/artists/albums/info/success' do
        get :info, params: { artist_id: '2228040235', album_id: '452973411' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/artists/albums/info/wrong_album' do
        get :info, params: { artist_id: '2228040235', album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if album present' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/artists/albums/description/success' do
        get :description, params: { artist_id: '2228040235', album_id: '452973411' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/artists/albums/description/wrong_album' do
        get :description, params: { artist_id: '2228040235', album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album present' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/artists/albums/tags/success' do
        get :tags, params: { artist_id: '2228040235', album_id: '452973411' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/artists/albums/tags/wrong_album' do
        get :tags, params: { artist_id: '2228040235', album_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
