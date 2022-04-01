RSpec.describe API::V2::LastFM::MultitagController, type: :controller do
  describe 'GET :artists' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/v2/lastfm/multitag/artists/success' do
        get :artists, params: { tags: %w[80s pop] }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
