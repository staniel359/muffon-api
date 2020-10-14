require 'rails_helper'

RSpec.describe API::V1::Bandcamp::AlbumsController, type: :controller do
  let(:wrong_artist) do
    {
      artist: Helpers::Base::RANDOM_STRING,
      album: 'indigo'
    }
  end
  let(:wrong_album) do
    {
      artist: 'wild nothing',
      album: Helpers::Base::RANDOM_STRING
    }
  end

  describe 'GET :info' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/bandcamp/albums/info/success' do
        get :info, params: { artist: 'wild nothing', album: 'indigo' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :info
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist' do
      VCR.use_cassette 'api/v1/bandcamp/albums/info/wrong_artist' do
        get :info, params: wrong_artist
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'api/v1/bandcamp/albums/info/wrong_album' do
        get :info, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :links' do
    it 'returns 200 if query present' do
      VCR.use_cassette 'api/v1/bandcamp/albums/links/success' do
        get :links, params: { artist: 'wild nothing', album: 'indigo' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no query' do
      get :links
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist' do
      VCR.use_cassette 'api/v1/bandcamp/albums/links/wrong_artist' do
        get :links, params: wrong_artist
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'api/v1/bandcamp/albums/links/wrong_album' do
        get :links, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
