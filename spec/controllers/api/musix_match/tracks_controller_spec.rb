RSpec.describe API::MusixMatch::TracksController do
  describe 'GET :info' do
    it 'returns 200 if track_slug present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/tracks/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            track_slug: 'Wild-Nothing/Chinatown'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_slug' do
      VCR.use_cassette(
        'controllers/api/musixmatch/tracks/info/wrong_slug'
      ) do
        get(
          :info,
          params: {
            **required_params,
            track_slug: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :lyrics' do
    it 'returns 200 if track_slug present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/tracks/lyrics/success'
      ) do
        get(
          :lyrics,
          params: {
            **required_params,
            track_slug: 'Wild-Nothing/Chinatown'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_slug' do
      VCR.use_cassette(
        'controllers/api/musixmatch/tracks/lyrics/wrong_slug'
      ) do
        get(
          :lyrics,
          params: {
            **required_params,
            track_slug: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if track_slug present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/tracks/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            track_slug: 'Wild-Nothing/Chinatown'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_slug' do
      VCR.use_cassette(
        'controllers/api/musixmatch/tracks/links/wrong_slug'
      ) do
        get(
          :links,
          params: {
            **required_params,
            track_slug: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if track_slug present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/tracks/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            track_slug: 'Wild-Nothing/Chinatown'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_slug' do
      VCR.use_cassette(
        'controllers/api/musixmatch/tracks/albums/wrong_slug'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            track_slug: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
