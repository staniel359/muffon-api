RSpec.describe API::V2::RateYourMusic::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album present' do
      VCR.use_cassette 'controllers/api/v2/rateyourmusic/albums/info/success' do
        get :info, params: { album: 'release/album/sparks/in-outer-space/' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'controllers/api/v2/rateyourmusic/albums/info/wrong_id' do
        get :info, params: { album: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album present' do
      VCR.use_cassette 'controllers/api/v2/rateyourmusic/albums/tags/success' do
        get :tags, params: { album: 'release/album/sparks/in-outer-space/' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'controllers/api/v2/rateyourmusic/albums/tags/wrong_id' do
        get :tags, params: { album: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
