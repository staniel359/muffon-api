require 'rails_helper'

RSpec.describe API::V1::Bandcamp::TracksController, type: :controller do
  describe 'GET :info' do
    let(:track_link) { 'wildnothingct.bandcamp.com/track/letting-go' }

    it 'returns 200 if track_link present' do
      VCR.use_cassette 'api/v1/bandcamp/tracks/info/success' do
        get :info, params: { track_link: track_link }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong track_link' do
      VCR.use_cassette 'api/v1/bandcamp/tracks/info/wrong_link' do
        get :info, params: { track_link: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
