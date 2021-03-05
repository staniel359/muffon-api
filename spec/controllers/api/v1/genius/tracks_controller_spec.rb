require 'rails_helper'

RSpec.describe API::V1::Genius::TracksController, type: :controller do
  describe 'GET :lyrics' do
    it 'returns 200 if path present' do
      VCR.use_cassette 'api/v1/genius/tracks/lyrics/success' do
        get :lyrics, params: { path: 'Molly-nilsson-1995-lyrics' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong path' do
      VCR.use_cassette 'api/v1/genius/tracks/lyrics/wrong_path' do
        get :lyrics, params: { path: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
