require 'rails_helper'

RSpec.describe API::V1::LastFM::ArtistsController, type: :controller do
  let(:success) { { artist: 'Wild Nothing' } }
  let(:no_name) { { artist: '' } }
  let(:wrong_name) { { artist: Helpers::LastFM::RANDOM_STRING } }

  describe 'GET :info' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'api/v1/artists/info/success' do
        get :info, params: success
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no artist name' do
      get :info, params: no_name
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/info/wrong_name' do
        get :info, params: wrong_name
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :images' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'api/v1/artists/images/success' do
        get :images, params: success
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no artist name' do
      get :images, params: no_name
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/images/wrong_name' do
        get :images, params: wrong_name
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :similar' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'api/v1/artists/similar/success' do
        get :similar, params: success
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no artist name' do
      get :similar, params: no_name
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/similar/wrong_name' do
        get :similar, params: wrong_name
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'api/v1/artists/tags/success' do
        get :tags, params: success
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no artist name' do
      get :tags, params: no_name
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/tags/wrong_name' do
        get :tags, params: wrong_name
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'api/v1/artists/albums/success' do
        get :albums, params: { artist: 'Wild Nothing' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no artist name' do
      get :albums, params: { artist: '' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/albums/wrong_artist' do
        get :albums, params: { artist: Helpers::LastFM::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'api/v1/artists/tracks/success' do
        get :tracks, params: { artist: 'Kate Bush' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no artist name' do
      get :tracks, params: { artist: '' }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/tracks/wrong_artist' do
        get :tracks, params: { artist: Helpers::LastFM::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
