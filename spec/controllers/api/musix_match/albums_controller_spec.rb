RSpec.describe API::MusixMatch::AlbumsController do
  describe 'GET :info' do
    it 'returns 200 if id present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            album_id: '14232026'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/info/wrong_id'
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

  describe 'GET :tags' do
    it 'returns 200 if id present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/tags/success'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            album_id: '14232026'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/tags/wrong_id'
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
    it 'returns 200 if id present' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            album_id: '14232026'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette(
        'controllers/api/musixmatch/albums/links/wrong_id'
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
