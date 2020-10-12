require 'rails_helper'

RSpec.describe API::V1::LastFM::Artists::AlbumsController, type: :controller do
  let(:wrong_album) do
    {
      artist: 'Wild Nothing',
      album: Helpers::LastFM::RANDOM_STRING
    }
  end
  let(:wrong_artist) do
    {
      artist: Helpers::LastFM::RANDOM_STRING,
      album: 'Nocturne'
    }
  end

  describe 'GET :info' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/albums/info/success' do
        get :info, params: { artist: 'Wild Nothing', album: 'Nocturne' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no album title' do
      get :info, params: { artist: 'Wild Nothing', album: '' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'api/v1/artists/albums/info/wrong_album' do
        get :info, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'returns 400 if no artist name' do
      get :info, params: { artist: '', album: 'Nocturne' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/albums/info/wrong_artist' do
        get :info, params: wrong_artist
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tags' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/albums/tags/success' do
        get :tags, params: { artist: 'Wild Nothing', album: 'Nocturne' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no album title' do
      get :tags, params: { artist: 'Wild Nothing', album: '' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'api/v1/artists/albums/tags/wrong_album' do
        get :tags, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'returns 400 if no artist name' do
      get :tags, params: { artist: '', album: 'Nocturne' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/albums/tags/wrong_artist' do
        get :tags, params: wrong_artist
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end