require 'rails_helper'

RSpec.describe API::V1::Discogs::GroupsController, type: :controller do
  describe 'GET :info' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette 'api/v1/discogs/groups/info/success' do
        get :info, params: { group_id: '28680' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette 'api/v1/discogs/groups/info/wrong_id' do
        get :info, params: { group_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :description' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette 'api/v1/discogs/groups/description/success' do
        get :description, params: { group_id: '28680' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette 'api/v1/discogs/groups/description/wrong_id' do
        get :description, params: { group_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette 'api/v1/discogs/groups/albums/success' do
        get :albums, params: { group_id: '28680' }
        expect(response).to have_http_status(:ok)
      end
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette 'api/v1/discogs/groups/albums/wrong_id' do
        get :albums, params: { group_id: Helpers::Base::RANDOM_STRING }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
