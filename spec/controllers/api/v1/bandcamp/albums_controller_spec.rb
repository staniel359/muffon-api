require 'rails_helper'

RSpec.describe API::V1::Bandcamp::AlbumsController, type: :controller do
  describe 'GET :info' do
    let(:album_link) { 'wildnothingct.bandcamp.com/album/indigo' }

    it 'returns 200 if album_link present' do
      VCR.use_cassette 'api/v1/bandcamp/albums/info/success' do
        get :info, params: { album_link: album_link }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong album_link' do
      VCR.use_cassette 'api/v1/bandcamp/albums/info/wrong_link' do
        get :info, params: { album_link: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
