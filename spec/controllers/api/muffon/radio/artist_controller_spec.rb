RSpec.describe API::Muffon::Radio::ArtistController do
  describe 'GET :tracks' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/muffon/radio/artist/tracks/success'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            artist_name: 'Wild Nothing'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get(
        :tracks,
        params: {
          **required_params,
          artist_name: ''
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/muffon/radio/artist/tracks/wrong_artist'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            artist_name: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :similar' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/muffon/radio/artist/similar/success'
      ) do
        get(
          :similar,
          params: {
            **required_params,
            artist_name: 'Wild Nothing'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no artist name' do
      get(
        :similar,
        params: {
          **required_params,
          artist_name: ''
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/muffon/radio/artist/similar/wrong_artist'
      ) do
        get(
          :similar,
          params: {
            **required_params,
            artist_name: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
