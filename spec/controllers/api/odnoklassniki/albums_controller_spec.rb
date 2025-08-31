RSpec.describe API::Odnoklassniki::AlbumsController do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette(
        'controllers/api/odnoklassniki/albums/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            album_id: '122909892023105'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/odnoklassniki/albums/info/wrong_id'
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
    it 'returns 200 if album_id present' do
      VCR.use_cassette(
        'controllers/api/odnoklassniki/albums/tags/success'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            album_id: '122909892023105'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/odnoklassniki/albums/tags/wrong_id'
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
        'controllers/api/odnoklassniki/albums/links/success'
      ) do
        get(
          :links,
          params: {
            **required_params,
            album_id: '122892151976711'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong album_id' do
      VCR.use_cassette(
        'controllers/api/odnoklassniki/albums/links/wrong_id'
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
