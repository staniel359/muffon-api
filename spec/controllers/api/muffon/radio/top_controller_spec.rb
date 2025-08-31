RSpec.describe API::Muffon::Radio::TopController do
  describe 'GET :artists' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/muffon/radio/top/artists/success' do
        get(
          :artists,
          params: {
            **required_params
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette 'controllers/api/muffon/radio/top/tracks/success' do
        get(
          :tracks,
          params: {
            **required_params
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end
end
