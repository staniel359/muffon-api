require 'rails_helper'

RSpec.describe API::V1::Bandcamp::IdController, type: :controller do
  describe 'GET :artist' do
    it 'returns 200 if artist present' do
      VCR.use_cassette 'api/v1/bandcamp/id/artist/success' do
        get :artist, params: { artist: 'wildnothingct' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong artist' do
      VCR.use_cassette 'api/v1/bandcamp/id/artist/wrong_name' do
        get :artist, params: { artist: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :album' do
    let(:wrong_album) do
      { artist: 'wildnothingct', album: Helpers::Base::RANDOM_STRING }
    end

    it 'returns 200 if album present' do
      VCR.use_cassette 'api/v1/bandcamp/id/album/success' do
        get :album, params: { artist: 'wildnothingct', album: 'indigo' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong album' do
      VCR.use_cassette 'api/v1/bandcamp/id/album/wrong_title' do
        get :album, params: wrong_album
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :track' do
    let(:wrong_track) do
      { artist: 'wildnothingct', track: Helpers::Base::RANDOM_STRING }
    end

    it 'returns 200 if track present' do
      VCR.use_cassette 'api/v1/bandcamp/id/track/success' do
        get :track, params: { artist: 'wildnothingct', track: 'letting-go' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong track' do
      VCR.use_cassette 'api/v1/bandcamp/id/track/wrong_title' do
        get :track, params: wrong_track
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
