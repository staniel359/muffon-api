RSpec.describe API::YouTube::PlaylistsController do
  describe 'GET :info' do
    it 'returns 200 if playlist present' do
      VCR.use_cassette 'controllers/api/youtube/playlists/info/success' do
        get :info, params: { playlist_id: 'PLrIyFAtNxiQaQwwLw2QuyTqHpZY5-lKPs' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong playlist' do
      VCR.use_cassette 'controllers/api/youtube/playlists/info/wrong_id' do
        get :info, params: { playlist_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if playlist present' do
      VCR.use_cassette 'controllers/api/youtube/playlists/description/success' do
        get :description, params: { playlist_id: 'PLUh4W61bt_K78wGbr6lUgPb5gjine4I6G' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong playlist' do
      VCR.use_cassette 'controllers/api/youtube/playlists/description/wrong_id' do
        get :description, params: { playlist_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :videos' do
    it 'returns 200 if playlist present' do
      VCR.use_cassette 'controllers/api/youtube/playlists/videos/success' do
        get :videos, params: { playlist_id: 'PLrIyFAtNxiQaQwwLw2QuyTqHpZY5-lKPs' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong playlist' do
      VCR.use_cassette 'controllers/api/youtube/playlists/videos/wrong_id' do
        get :videos, params: { playlist_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
