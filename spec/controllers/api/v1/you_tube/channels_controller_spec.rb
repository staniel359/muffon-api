RSpec.describe API::V1::YouTube::ChannelsController, type: :controller do
  describe 'GET :videos' do
    it 'returns 200 if channel present' do
      VCR.use_cassette 'controllers/api/v1/youtube/channels/videos/success' do
        get :videos, params: { channel_id: 'UCZBXFjbyp1gezLRsDbG2hKQ' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong channel' do
      VCR.use_cassette 'controllers/api/v1/youtube/channels/videos/wrong_id' do
        get :videos, params: { channel_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
