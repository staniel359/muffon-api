RSpec.describe API::Discogs::AlbumsController do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette(
        'controllers/api/discogs/albums/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            album_id: '16233996'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/discogs/albums/info/wrong_id'
      ) do
        get(
          :info,
          params: {
            **required_params,
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette(
        'controllers/api/discogs/albums/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            album_id: '16233996'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/discogs/albums/description/wrong_id'
      ) do
        get(
          :description,
          params: {
            **required_params,
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette(
        'controllers/api/discogs/albums/tags/success'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            album_id: '16233996'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/discogs/albums/tags/wrong_id'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette(
        'controllers/api/discogs/albums/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            album_id: '16233996'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/discogs/albums/links/wrong_id'
      ) do
        get(
          :links,
          params: {
            **required_params,
            album_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
