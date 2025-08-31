RSpec.describe API::LastFM::Artists::AlbumsController do
  describe 'GET :info' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/info/wrong_album'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/info/wrong_artist'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_name: random_string,
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/description/wrong_album'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/description/wrong_artist'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_name: random_string,
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/tags/success'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/tags/wrong_album'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/tags/wrong_artist'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_name: random_string,
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :listeners_count' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/listeners/success'
      ) do
        get(
          :listeners_count,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/listeners/wrong_album'
      ) do
        get(
          :listeners_count,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/listeners/wrong_artist'
      ) do
        get(
          :listeners_count,
          params: {
            **required_params,
            artist_name: random_string,
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :profiles' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/profiles/success'
      ) do
        get(
          :profiles,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/profiles/wrong_album'
      ) do
        get(
          :profiles,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/profiles/wrong_artist'
      ) do
        get(
          :profiles,
          params: {
            **required_params,
            artist_name: random_string,
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/links/wrong_album'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_name: 'Wild Nothing',
            album_title: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette(
        'controllers/api/lastfm/artists/albums/links/wrong_artist'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_name: random_string,
            album_title: 'Nocturne'
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
