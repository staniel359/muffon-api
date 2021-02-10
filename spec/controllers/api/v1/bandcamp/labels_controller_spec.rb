require 'rails_helper'

RSpec.describe API::V1::Bandcamp::LabelsController, type: :controller do
  describe 'GET :artists' do
    it 'returns 200 if label present' do
      VCR.use_cassette 'api/v1/bandcamp/labels/artists/success' do
        get :artists, params: { label: 'capturedtracks' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong label' do
      VCR.use_cassette 'api/v1/bandcamp/labels/artists/wrong_label' do
        get :artists, params: { label: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if label present' do
      VCR.use_cassette 'api/v1/bandcamp/labels/albums/success' do
        get :albums, params: { label: 'capturedtracks' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong label' do
      VCR.use_cassette 'api/v1/bandcamp/labels/albums/wrong_label' do
        get :albums, params: { label: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
