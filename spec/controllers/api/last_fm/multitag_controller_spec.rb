RSpec.describe API::LastFM::MultitagController do
  describe 'GET :artists' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/multitag/artists/success' do
        get :artists, params: { tags: %w[80s pop] }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/lastfm/multitag/albums/success' do
        get :albums, params: { tags: %w[80s pop] }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
