RSpec.describe API::YouTube::ChannelsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if channel present' do
      VCR.use_cassette 'controllers/api/youtube/channels/info/success' do
        get :info, params: { channel_id: 'UCZBXFjbyp1gezLRsDbG2hKQ' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong channel' do
      VCR.use_cassette 'controllers/api/youtube/channels/info/wrong_id' do
        get :info, params: { channel_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if channel present' do
      VCR.use_cassette 'controllers/api/youtube/channels/description/success' do
        get :description, params: { channel_id: 'UCZBXFjbyp1gezLRsDbG2hKQ' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong channel' do
      VCR.use_cassette 'controllers/api/youtube/channels/description/wrong_id' do
        get :description, params: { channel_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :videos' do
    it 'returns 200 if channel present' do
      VCR.use_cassette 'controllers/api/youtube/channels/videos/success' do
        get :videos, params: { channel_id: 'UCZBXFjbyp1gezLRsDbG2hKQ' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong channel' do
      VCR.use_cassette 'controllers/api/youtube/channels/videos/wrong_id' do
        get :videos, params: { channel_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
