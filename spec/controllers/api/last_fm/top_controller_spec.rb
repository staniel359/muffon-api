RSpec.describe API::LastFM::TopController do
  describe 'GET :artists' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/top/artists/success' do
        get :artists
      end

      expect(response).to have_http_status(:ok)
    end
  end

  # describe 'GET :albums' do
  #   it 'returns 200' do
  #     VCR.use_cassette 'controllers/api/lastfm/top/albums/success' do
  #       get :albums
  #     end

  #     expect(response).to have_http_status(:ok)
  #   end
  # end

  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/top/tracks/success' do
        get :tracks
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :tags' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/top/tags/success' do
        get :tags
      end

      expect(response).to have_http_status(:ok)
    end
  end
end
