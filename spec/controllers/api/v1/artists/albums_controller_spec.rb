require 'rails_helper'

RSpec.describe API::V1::Artists::AlbumsController, type: :controller do
  describe 'GET :index' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'api/v1/artists/albums/index/success' do
        get :index, params: { artist: 'Wild Nothing' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no artist name' do
      VCR.use_cassette 'api/v1/artists/albums/index/no_artist' do
        get :index, params: { artist: '' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/albums/index/wrong_artist' do
        get :index, params: { artist: Helpers::LastFM::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :show' do
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

    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/albums/show/success' do
        get :show, params: { artist: 'Wild Nothing', album: 'Nocturne' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no album title' do
      VCR.use_cassette 'api/v1/artists/albums/show/no_album' do
        get :show, params: { artist: 'Wild Nothing', album: '' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    it 'returns 404 if wrong album title' do
      VCR.use_cassette 'api/v1/artists/albums/show/wrong_album' do
        get :show, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'returns 400 if no artist name' do
      VCR.use_cassette 'api/v1/artists/albums/show/no_artist' do
        get :show, params: { artist: '', album: 'Nocturne' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/albums/show/wrong_artist' do
        get :show, params: wrong_artist
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
