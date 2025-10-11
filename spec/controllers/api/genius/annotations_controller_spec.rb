RSpec.describe API::Genius::AnnotationsController do
  describe 'GET :info' do
    it 'returns 200 if annotation present' do
      VCR.use_cassette(
        'controllers/api/genius/annotations/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            annotation_id: '3128578'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette(
        'controllers/api/genius/annotations/info/wrong_id'
      ) do
        get(
          :info,
          params: {
            **required_params,
            annotation_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
