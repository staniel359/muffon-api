RSpec.describe API::LastFM::Artists::TracksController do
  describe 'GET :info' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/info/wrong_track'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/info/wrong_artist'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_name: random_string,
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/description/wrong_track'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/description/wrong_artist'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_name: random_string,
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/tags/success'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/tags/wrong_track'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/tags/wrong_artist'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_name: random_string,
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :similar' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/similar/success'
      ) do
        get(
          :similar,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/similar/wrong_track'
      ) do
        get(
          :similar,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/similar/wrong_artist'
      ) do
        get(
          :similar,
          params: {
            **required_params,
            artist_name: random_string,
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :profiles' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/profiles/success'
      ) do
        get(
          :profiles,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/profiles/wrong_track'
      ) do
        get(
          :profiles,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/profiles/wrong_artist'
      ) do
        get(
          :profiles,
          params: {
            **required_params,
            artist_name: random_string,
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/links/wrong_track'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/links/wrong_artist'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_name: random_string,
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/albums/wrong_track'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_name: 'Kate Bush',
            track_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/tracks/albums/wrong_artist'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            artist_name: random_string,
            track_title: 'Hounds Of Love'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
