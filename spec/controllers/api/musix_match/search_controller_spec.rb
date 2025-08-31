RSpec.describe API::MusixMatch::SearchController do
  describe 'GET :artists' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/search/artists/success'
      ) do
        get(
          :artists,
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
        :artists,
        params: {
          **required_params
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette(
        'controllers/api/musixmatch/search/artists/wrong_query'
      ) do
        get(
          :artists,
          params: {
            **required_params,
            query: random_string
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/search/tracks/success'
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
        'controllers/api/musixmatch/search/tracks/wrong_query'
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
end
