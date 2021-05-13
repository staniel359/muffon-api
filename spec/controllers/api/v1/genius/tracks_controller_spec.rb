require 'rails_helper'

RSpec.describe API::V1::Genius::TracksController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'api/v1/genius/tracks/info/success' do
        get :info, params: { track_id: 'Molly-nilsson-1995-lyrics' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong id' do
      VCR.use_cassette 'api/v1/genius/tracks/info/wrong_id' do
        get :info, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :lyrics' do
    it 'returns 200 if id present' do
      VCR.use_cassette 'api/v1/genius/tracks/lyrics/success' do
        get :lyrics, params: { track_id: 'Molly-nilsson-1995-lyrics' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong id' do
      VCR.use_cassette 'api/v1/genius/tracks/lyrics/wrong_id' do
        get :lyrics, params: { track_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
