require 'rails_helper'

RSpec.describe API::V1::Spotify::AlbumsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if album_id present' do
      VCR.use_cassette 'api/v1/spotify/albums/info/success' do
        get :info, params: { album_id: '3OYnManu1Nlxnw9OMng7BH' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong album_id' do
      VCR.use_cassette 'api/v1/spotify/albums/info/wrong_id' do
        get :info, params: { album_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end