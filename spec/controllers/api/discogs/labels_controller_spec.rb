RSpec.describe API::Discogs::LabelsController do
  describe 'GET :info' do
    it 'returns 200 if label_id present' do
      VCR.use_cassette(
        'controllers/api/discogs/label/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            label_id: '26126'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong label_id' do
      VCR.use_cassette(
        'controllers/api/discogs/label/info/wrong_id'
      ) do
        get(
          :info,
          params: {
            **required_params,
            label_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if label_id present' do
      VCR.use_cassette(
        'controllers/api/discogs/label/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            label_id: '26126'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong label_id' do
      VCR.use_cassette(
        'controllers/api/discogs/label/description/wrong_id'
      ) do
        get(
          :description,
          params: {
            **required_params,
            label_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if label_id present' do
      VCR.use_cassette(
        'controllers/api/discogs/label/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            label_id: '26126'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong label_id' do
      VCR.use_cassette(
        'controllers/api/discogs/label/albums/wrong_id'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            label_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
