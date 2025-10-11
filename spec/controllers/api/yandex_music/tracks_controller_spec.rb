RSpec.describe API::YandexMusic::TracksController do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette(
        'controllers/api/yandexmusic/tracks/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            track_id: '4780792'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/yandexmusic/tracks/info/wrong_id'
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
        'controllers/api/yandexmusic/tracks/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            track_id: '4780792'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/yandexmusic/tracks/links/wrong_id'
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
        'controllers/api/yandexmusic/tracks/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            track_id: '4780792'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/yandexmusic/tracks/albums/wrong_id'
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
