RSpec.describe API::YouTube::VideosController do
  describe 'GET :info' do
    it 'returns 200 if video_id present' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            video_id: '1aTIkQf3eRY'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong video_id' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/info/wrong_id'
      ) do
        get(
          :info,
          params: {
            **required_params,
            video_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if video_id present' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            video_id: '1aTIkQf3eRY'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong video_id' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/description/wrong_id'
      ) do
        get(
          :description,
          params: {
            **required_params,
            video_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if video_id present' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/tags/success'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            video_id: '1aTIkQf3eRY'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong video_id' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/tags/wrong_id'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            video_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :similar' do
    it 'returns 200 if video_id present' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/similar/success'
      ) do
        get(
          :similar,
          params: {
            **required_params,
            video_id: '1aTIkQf3eRY'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong video_id' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/similar/wrong_id'
      ) do
        get(
          :similar,
          params: {
            **required_params,
            video_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if video_id present' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            video_id: '1aTIkQf3eRY'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong video_id' do
      VCR.use_cassette(
        'controllers/api/youtube/videos/links/wrong_id'
      ) do
        get(
          :links,
          params: {
            **required_params,
            video_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
