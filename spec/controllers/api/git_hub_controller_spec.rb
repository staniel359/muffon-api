RSpec.describe API::GitHubController do
  describe 'GET :releases' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/github/releases/success'
      ) do
        get(
          :releases,
          params: {
            **required_params
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end
  end
end
