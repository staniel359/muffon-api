RSpec.describe API::Bandcamp::Artists::TracksController do
  describe 'GET :info' do
    it 'returns 200 if track present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: '2723372494'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/info/wrong_track'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if track present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: '2723372494'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/description/wrong_track'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if track present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/tags/success'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: '2723372494'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/tags/wrong_track'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if track present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: '2723372494'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/links/wrong_track'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if track present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: '2723372494'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/tracks/albums/wrong_track'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_id: '2228040235',
            track_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
