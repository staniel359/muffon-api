require 'rails_helper'

RSpec.describe(
  API::V1::Bandcamp::Artists::TracksController, type: :controller
) do
  let(:wrong_album) do
    { artist: 'wildnothingct', track: Helpers::Base::RANDOM_STRING }
  end

  describe 'GET :info' do
    it 'returns 200 if track present' do
      VCR.use_cassette 'api/v1/bandcamp/artists/tracks/info/success' do
        get :info, params: { artist: 'wildnothingct', track: 'letting-go' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette 'api/v1/bandcamp/artists/tracks/info/wrong_track' do
        get :info, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
