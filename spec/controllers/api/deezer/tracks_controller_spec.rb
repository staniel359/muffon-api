RSpec.describe API::Deezer::TracksController do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette(
        'controllers/api/deezer/tracks/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            track_id: '11616579'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/deezer/tracks/info/wrong_id'
      ) do
        get(
          :info,
          params: {
            **required_params,
            track_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette(
        'controllers/api/deezer/tracks/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            track_id: '11616579'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/deezer/tracks/links/wrong_id'
      ) do
        get(
          :links,
          params: {
            **required_params,
            track_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette(
        'controllers/api/deezer/tracks/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            track_id: '11616579'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/deezer/tracks/albums/wrong_id'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            track_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
