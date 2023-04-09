RSpec.describe API::MusicBrainz::TracksController do
  describe 'GET :info' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/musicbrainz/tracks/info/success' do
        get :info, params: { track_id: '6029d549-5858-4936-9156-b90770d2ae92' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette 'controllers/api/musicbrainz/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'controllers/api/musicbrainz/tracks/tags/success' do
        get :tags, params: { track_id: '6029d549-5858-4936-9156-b90770d2ae92' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong id' do
      VCR.use_cassette 'controllers/api/musicbrainz/tracks/tags/wrong_id' do
        get :tags, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
