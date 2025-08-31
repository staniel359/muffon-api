RSpec.describe API::Genius::AlbumsController do
  describe 'GET :info' do
    it 'returns 200 if id present' do
      VCR.use_cassette(
        'controllers/api/genius/albums/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            album_id: '168168'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette(
        'controllers/api/genius/albums/info/wrong_id'
      ) do
        get(
          :info,
          params: {
            **required_params,
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if id present' do
      VCR.use_cassette(
        'controllers/api/genius/albums/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            album_id: '168168'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette(
        'controllers/api/genius/albums/description/wrong_id'
      ) do
        get(
          :description,
          params: {
            **required_params,
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if id present' do
      VCR.use_cassette(
        'controllers/api/genius/albums/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            album_id: '168168'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette(
        'controllers/api/genius/albums/links/wrong_id'
      ) do
        get(
          :links,
          params: {
            **required_params,
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
