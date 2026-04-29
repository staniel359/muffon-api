RSpec.describe API::Audius::AlbumsController do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette(
        'controllers/api/audius/albums/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            album_id: '156107796'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/audius/albums/info/wrong_id'
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
    it 'returns 200 if album_id present' do
      VCR.use_cassette(
        'controllers/api/audius/albums/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            album_id: '156107796'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/audius/albums/description/wrong_id'
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
    it 'returns 200 if album_id present' do
      VCR.use_cassette(
        'controllers/api/audius/albums/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            album_id: '156107796'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/audius/albums/links/wrong_id'
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
