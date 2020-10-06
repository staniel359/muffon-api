require 'rails_helper'

RSpec.describe API::V1::Artists::AlbumsController, type: :controller do
  let(:params) do
    {
      artist: 'Wild Nothing',
      album: 'Nocturne'
    }
  end

  describe 'GET :index' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/albums/index' do
        get :index, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET :show' do
    it 'returns 200' do
      VCR.use_cassette 'api/v1/artists/albums/show' do
        get :show, params: params
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
