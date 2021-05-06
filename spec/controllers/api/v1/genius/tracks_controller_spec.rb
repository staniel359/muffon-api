require 'rails_helper'

RSpec.describe API::V1::Genius::TracksController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if path present' do
      VCR.use_cassette 'api/v1/genius/tracks/info/success' do
        get :info, params: { path: 'Molly-nilsson-1995-lyrics' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong path' do
      VCR.use_cassette 'api/v1/genius/tracks/info/wrong_path' do
        get :info, params: { path: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :lyrics' do
    it 'returns 200 if path present' do
      VCR.use_cassette 'api/v1/genius/tracks/lyrics/success' do
        get :lyrics, params: { path: 'Molly-nilsson-1995-lyrics' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if wrong path' do
      VCR.use_cassette 'api/v1/genius/tracks/lyrics/wrong_path' do
        get :lyrics, params: { path: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
