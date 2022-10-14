RSpec.describe API::Bandcamp::IdController do
  describe 'GET :artist' do
    it 'returns 200 if artist present' do
      VCR.use_cassette 'controllers/api/bandcamp/id/artist/success' do
        get :artist, params: { artist: 'wildnothingct' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong artist' do
      VCR.use_cassette 'controllers/api/bandcamp/id/artist/wrong_name' do
        get :artist, params: { artist: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :album' do
    it 'returns 200 if album present' do
      VCR.use_cassette 'controllers/api/bandcamp/id/album/success' do
        get :album, params: { artist: 'wildnothingct', album: 'indigo' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'controllers/api/bandcamp/id/album/wrong_title' do
        get :album, params: { artist: 'wildnothingct', album: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :track' do
    it 'returns 200 if track present' do
      VCR.use_cassette 'controllers/api/bandcamp/id/track/success' do
        get :track, params: { artist: 'wildnothingct', track: 'letting-go' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette 'controllers/api/bandcamp/id/track/wrong_title' do
        get :track, params: { artist: 'wildnothingct', track: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
