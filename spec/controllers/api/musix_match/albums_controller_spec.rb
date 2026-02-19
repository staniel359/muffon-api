RSpec.describe API::MusixMatch::AlbumsController do
  describe 'GET :info' do
    it 'returns 200 if album_slug present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            album_slug: 'Wild-Nothing/Nocturne-4'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_slug' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/info/wrong_slug'
      ) do
        get(
          :info,
          params: {
            **required_params,
            album_slug: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if album_slug present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            album_slug: 'Wild-Nothing/Nocturne-4'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_slug' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/links/wrong_slug'
      ) do
        get(
          :links,
          params: {
            **required_params,
            album_slug: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
