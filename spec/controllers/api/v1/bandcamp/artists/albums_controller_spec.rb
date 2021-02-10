require 'rails_helper'

RSpec.describe(
  API::V1::Bandcamp::Artists::AlbumsController, type: :controller
) do
  let(:album) { { artist_id: '2228040235', album_id: '452973411' } }
  let(:wrong_album) do
    { artist_id: '2228040235', album_id: Helpers::Base::RANDOM_STRING }
  end

  describe 'GET :info' do
    it 'returns 200 if album present' do
      VCR.use_cassette 'api/v1/bandcamp/artists/albums/info/success' do
        get :info, params: album
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'api/v1/bandcamp/artists/albums/info/wrong_album' do
        get :info, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :description' do
    it 'returns 200 if album present' do
      VCR.use_cassette 'api/v1/bandcamp/artists/albums/desc/success' do
        get :description, params: album
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'api/v1/bandcamp/artists/albums/desc/wrong_album' do
        get :description, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if album present' do
      VCR.use_cassette 'api/v1/bandcamp/artists/albums/tags/success' do
        get :tags, params: album
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'api/v1/bandcamp/artists/albums/tags/wrong_album' do
        get :tags, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
