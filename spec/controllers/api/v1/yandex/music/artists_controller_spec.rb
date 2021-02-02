require 'rails_helper'

RSpec.describe API::V1::Yandex::Music::ArtistsController, type: :controller do
  describe 'GET :albums' do
    it 'returns 200 if artist_id present' do
      VCR.use_cassette 'api/v1/yandex/music/artists/albums/success' do
        get :albums, params: { artist_id: '15446' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if wrong artist_id' do
      VCR.use_cassette 'api/v1/yandex/music/artists/albums/wrong_id' do
        get :albums, params: { artist_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
