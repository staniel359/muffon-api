require 'rails_helper'

RSpec.describe API::V1::Bandcamp::AlbumsController, type: :controller do
  describe 'GET :info' do
    let(:link) { 'wildnothingct.bandcamp.com/album/indigo' }

    it 'returns 200 if link present' do
      VCR.use_cassette 'api/v1/bandcamp/albums/info/success' do
        get :info, params: { link: link }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong link' do
      VCR.use_cassette 'api/v1/bandcamp/albums/info/wrong_link' do
        get :info, params: { link: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :description' do
    let(:link) { 'wildnothingct.bandcamp.com/album/indigo' }

    it 'returns 200 if link present' do
      VCR.use_cassette 'api/v1/bandcamp/albums/description/success' do
        get :description, params: { link: link }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong link' do
      VCR.use_cassette 'api/v1/bandcamp/albums/description/wrong_link' do
        get :description, params: { link: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tags' do
    let(:link) { 'luxuryelite.bandcamp.com/album/high-society' }

    it 'returns 200 if link present' do
      VCR.use_cassette 'api/v1/bandcamp/albums/tags/success' do
        get :tags, params: { link: link }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong link' do
      VCR.use_cassette 'api/v1/bandcamp/albums/tags/wrong_link' do
        get :tags, params: { link: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
