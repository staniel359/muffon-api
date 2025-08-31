RSpec.describe API::YouTubeMusic::SearchController do
  describe 'GET :tracks' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/search/tracks/success'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            query: 'wild nothing'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get(
        :tracks,
        params: {
          **required_params
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/search/tracks/wrong_query'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            query: random_string
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :videos' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/search/videos/success'
      ) do
        get(
          :videos,
          params: {
            **required_params,
            query: 'wild nothing'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get(
        :videos,
        params: {
          **required_params
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/search/videos/wrong_query'
      ) do
        get(
          :videos,
          params: {
            **required_params,
            query: random_string
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :mixes' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/search/mixes/success'
      ) do
        get(
          :mixes,
          params: {
            **required_params,
            query: '80s'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get(
        :mixes,
        params: {
          **required_params
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/search/mixes/wrong_query'
      ) do
        get(
          :mixes,
          params: {
            **required_params,
            query: random_string
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :playlists' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/search/playlists/success'
      ) do
        get(
          :playlists,
          params: {
            **required_params,
            query: '80s'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get(
        :playlists,
        params: {
          **required_params
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette(
        'controllers/api/youtubemusic/search/playlists/wrong_query'
      ) do
        get(
          :playlists,
          params: {
            **required_params,
            query: random_string
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end
end
