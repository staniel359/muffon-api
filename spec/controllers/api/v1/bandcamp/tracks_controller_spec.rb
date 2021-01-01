require 'rails_helper'

RSpec.describe API::V1::Bandcamp::TracksController, type: :controller do
  describe 'GET :info' do
    let(:link) { 'wildnothingct.bandcamp.com/track/letting-go' }

    it 'returns 200 if link present' do
      VCR.use_cassette 'api/v1/bandcamp/tracks/info/success' do
        get :info, params: { link: link }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong link' do
      VCR.use_cassette 'api/v1/bandcamp/tracks/info/wrong_link' do
        get :info, params: { link: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
