RSpec.describe API::Audius::SearchController do
  describe 'GET :artists' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/audius/search/artists/success'
      ) do
        get(
          :artists,
          params: {
            **required_params,
            query: 'john doe'
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
  end

  describe 'GET :albums' do
    it 'returns 200 if query present' do
      VCR.use_cassette(
        'controllers/api/audius/search/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            query: 'a'
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
  end
end
