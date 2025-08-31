RSpec.describe API::Bandcamp::Artists::AlbumsController do
  describe 'GET :info' do
    it 'returns 200 if album present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_id: '2228040235',
            album_id: '452973411'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/info/wrong_album'
      ) do
        get(
          :info,
          params: {
            **required_params,
            artist_id: '2228040235',
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if album present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_id: '2228040235',
            album_id: '452973411'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/description/wrong_album'
      ) do
        get(
          :description,
          params: {
            **required_params,
            artist_id: '2228040235',
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/tags/success'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_id: '2228040235',
            album_id: '452973411'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/tags/wrong_album'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            artist_id: '2228040235',
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if album present' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_id: '2228040235',
            album_id: '452973411'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette(
        'controllers/api/bandcamp/artists/albums/links/wrong_album'
      ) do
        get(
          :links,
          params: {
            **required_params,
            artist_id: '2228040235',
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
