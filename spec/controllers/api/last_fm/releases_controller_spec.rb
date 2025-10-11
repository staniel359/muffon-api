RSpec.describe API::LastFM::ReleasesController do
  describe 'GET :new' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/releases/new/success'
      ) do
        get(
          :new,
          params: {
            **required_params,
            page: 2,
            profile_id: 1
          }
        )

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :upcoming' do
    it 'returns 200' do
      VCR.use_cassette(
        'controllers/api/lastfm/releases/upcoming/success'
      ) do
        get(
          :upcoming,
          params: {
            **required_params,
            page: 2,
            profile_id: 1
          }
        )

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
