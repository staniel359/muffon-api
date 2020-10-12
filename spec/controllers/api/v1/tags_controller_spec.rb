require 'rails_helper'

RSpec.describe API::V1::TagsController, type: :controller do
  let(:tag) { { tag: 'dream pop' } }
  let(:no_tag) { { tag: '' } }
  let(:wrong_tag) { { tag: Helpers::LastFM::RANDOM_STRING } }

  describe 'GET :info' do
    it 'returns 200 if tag exists' do
      VCR.use_cassette 'api/v1/tags/info/success' do
        get :info, params: tag
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no tag name' do
      get :info, params: no_tag
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 400 if wrong tag name' do
      VCR.use_cassette 'api/v1/tags/info/wrong_tag' do
        get :info, params: wrong_tag
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :artists' do
    it 'returns 200 if any artists' do
      VCR.use_cassette 'api/v1/tags/artists/success' do
        get :artists, params: tag
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no tag name' do
      get :artists, params: no_tag
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 400 if wrong tag name' do
      VCR.use_cassette 'api/v1/tags/artists/wrong_tag' do
        get :artists, params: wrong_tag
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if any albums' do
      VCR.use_cassette 'api/v1/tags/albums/success' do
        get :albums, params: tag
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no tag name' do
      get :albums, params: no_tag
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 400 if wrong tag name' do
      VCR.use_cassette 'api/v1/tags/albums/wrong_tag' do
        get :albums, params: wrong_tag
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if any tracks' do
      VCR.use_cassette 'api/v1/tags/tracks/success' do
        get :tracks, params: tag
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 400 if no tag name' do
      get :tracks, params: no_tag
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 400 if wrong tag name' do
      VCR.use_cassette 'api/v1/tags/tracks/wrong_tag' do
        get :tracks, params: wrong_tag
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
