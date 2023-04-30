RSpec.describe API::VK::TracksController do
  describe 'GET :info' do
    it 'returns 200 if track exists' do
      VCR.use_cassette 'controllers/api/vk/tracks/info/success' do
        get :info, params: { track_id: '-2001472560_55472560' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'controllers/api/vk/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if track exists' do
      VCR.use_cassette 'controllers/api/vk/tracks/links/success' do
        get :links, params: { track_id: '-2001472560_55472560' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'controllers/api/vk/tracks/links/wrong_id' do
        get :links, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
