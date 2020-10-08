require 'rails_helper'

RSpec.describe API::V1::Artists::TracksController, type: :controller do
  let(:wrong_track) do
    {
      artist: 'Kate Bush',
      track: Helpers::LastFM::RANDOM_STRING
    }
  end
  let(:wrong_artist) do
    {
      artist: Helpers::LastFM::RANDOM_STRING,
      track: 'Hounds Of Love'
    }
  end

  describe 'GET :tracks' do
    it 'returns 200 if artist exists' do
      VCR.use_cassette 'api/v1/artists/tracks/tracks/success' do
        get :tracks, params: { artist: 'Kate Bush' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no artist name' do
      VCR.use_cassette 'api/v1/artists/tracks/tracks/no_artist' do
        get :tracks, params: { artist: '' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/tracks/tracks/wrong_artist' do
        get :tracks, params: { artist: Helpers::LastFM::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :info' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/tracks/info/success' do
        get :info, params: { artist: 'Kate Bush', track: 'Hounds Of Love' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no track title' do
      VCR.use_cassette 'api/v1/artists/tracks/info/no_track' do
        get :info, params: { artist: 'Kate Bush', track: '' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette 'api/v1/artists/tracks/info/wrong_track' do
        get :info, params: wrong_track
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'returns 400 if no artist name' do
      VCR.use_cassette 'api/v1/artists/tracks/info/no_artist' do
        get :info, params: { artist: '', track: 'Hounds Of Love' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/tracks/info/wrong_artist' do
        get :info, params: wrong_artist
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tags' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/tracks/tags/success' do
        get :tags, params: { artist: 'Kate Bush', track: 'Hounds Of Love' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no track title' do
      VCR.use_cassette 'api/v1/artists/tracks/tags/no_track' do
        get :tags, params: { artist: 'Kate Bush', track: '' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    it 'returns 404 if wrong track title' do
      VCR.use_cassette 'api/v1/artists/tracks/tags/wrong_track' do
        get :tags, params: wrong_track
        expect(response).to have_http_status(:not_found)
      end
    end

    it 'returns 400 if no artist name' do
      VCR.use_cassette 'api/v1/artists/tracks/tags/no_artist' do
        get :tags, params: { artist: '', track: 'Hounds Of Love' }
        expect(response).to have_http_status(:bad_request)
      end
    end

    it 'returns 404 if wrong artist name' do
      VCR.use_cassette 'api/v1/artists/tracks/tags/wrong_artist' do
        get :tags, params: wrong_artist
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
