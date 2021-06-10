RSpec.describe API::V1::YouTube::VideosController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if video_id present' do
      VCR.use_cassette 'controllers/api/v1/youtube/videos/info/success' do
        get :info, params: { video_id: '1aTIkQf3eRY' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong video_id' do
      VCR.use_cassette 'controllers/api/v1/youtube/videos/info/wrong_id' do
        get :info, params: { video_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if video_id present' do
      VCR.use_cassette 'controllers/api/v1/youtube/videos/description/success' do
        get :description, params: { video_id: '1aTIkQf3eRY' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong video_id' do
      VCR.use_cassette 'controllers/api/v1/youtube/videos/description/wrong_id' do
        get :description, params: { video_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if video_id present' do
      VCR.use_cassette 'controllers/api/v1/youtube/videos/tags/success' do
        get :tags, params: { video_id: '1aTIkQf3eRY' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong video_id' do
      VCR.use_cassette 'controllers/api/v1/youtube/videos/tags/wrong_id' do
        get :tags, params: { video_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
