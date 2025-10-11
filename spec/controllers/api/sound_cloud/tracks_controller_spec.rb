RSpec.describe API::SoundCloud::TracksController do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette(
        'controllers/api/soundcloud/tracks/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            track_id: '12472418'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/soundcloud/tracks/info/wrong_id'
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

  describe 'GET :description' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette(
        'controllers/api/soundcloud/tracks/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            track_id: '12472418'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/soundcloud/tracks/description/wrong_id'
      ) do
        get(
          :description,
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
        'controllers/api/soundcloud/tracks/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            track_id: '12472418'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/soundcloud/tracks/links/wrong_id'
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
        'controllers/api/soundcloud/tracks/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            track_id: '12472418'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette(
        'controllers/api/soundcloud/tracks/albums/wrong_id'
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
