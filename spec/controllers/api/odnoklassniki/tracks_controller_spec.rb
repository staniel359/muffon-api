RSpec.describe API::Odnoklassniki::TracksController do
  describe 'GET :info' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette 'controllers/api/odnoklassniki/tracks/info/success' do
        get :info, params: { track_id: '123042442621275' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'controllers/api/odnoklassniki/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette 'controllers/api/odnoklassniki/tracks/links/success' do
        get :links, params: { track_id: '123042442621275' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'controllers/api/odnoklassniki/tracks/links/wrong_id' do
        get :links, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if track_id present' do
      VCR.use_cassette 'controllers/api/odnoklassniki/tracks/albums/success' do
        get :albums, params: { track_id: '123005877249254' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong track_id' do
      VCR.use_cassette 'controllers/api/odnoklassniki/tracks/albums/wrong_id' do
        get :albums, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
