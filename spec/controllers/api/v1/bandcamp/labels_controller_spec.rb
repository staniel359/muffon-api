require 'rails_helper'

RSpec.describe API::V1::Bandcamp::LabelsController, type: :controller do
  describe 'GET :artists' do
    it 'returns 200 if label present' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/labels/artists/success' do
        get :artists, params: { label_id: '2304199212' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong label' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/labels/artists/wrong_label' do
        get :artists, params: { label_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if label present' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/labels/albums/success' do
        get :albums, params: { label_id: '2304199212' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong label' do
      VCR.use_cassette 'controllers/api/v1/bandcamp/labels/albums/wrong_label' do
        get :albums, params: { label_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
