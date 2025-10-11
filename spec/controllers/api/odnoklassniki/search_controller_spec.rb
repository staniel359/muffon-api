RSpec.describe API::Odnoklassniki::SearchController do
  describe 'GET :artists' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/odnoklassniki/search/artists/success'
      ) do
        get(
          :artists,
          params: {
            **required_params,
            query: 'kate bush'
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
        'controllers/api/odnoklassniki/search/artists/wrong_query'
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

  describe 'GET :albums' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/odnoklassniki/search/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            query: 'kate bush'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no query' do
      get(
        :albums,
        params: {
          **required_params
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong query' do
      VCR.use_cassette(
        'controllers/api/odnoklassniki/search/albums/wrong_query'
      ) do
        get(
          :albums,
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
        'controllers/api/odnoklassniki/search/tracks/success'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            query: 'kate bush'
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
        'controllers/api/odnoklassniki/search/tracks/wrong_query'
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
