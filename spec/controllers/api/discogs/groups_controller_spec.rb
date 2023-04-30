RSpec.describe API::Discogs::GroupsController do
  describe 'GET :info' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette 'controllers/api/discogs/groups/info/success' do
        get :info, params: { group_id: '28680' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette 'controllers/api/discogs/groups/info/wrong_id' do
        get :info, params: { group_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette 'controllers/api/discogs/groups/description/success' do
        get :description, params: { group_id: '28680' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette 'controllers/api/discogs/groups/description/wrong_id' do
        get :description, params: { group_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette 'controllers/api/discogs/groups/tags/success' do
        get :tags, params: { group_id: '28680' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette 'controllers/api/discogs/groups/tags/wrong_id' do
        get :tags, params: { group_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette 'controllers/api/discogs/groups/albums/success' do
        get :albums, params: { group_id: '28680' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette 'controllers/api/discogs/groups/albums/wrong_id' do
        get :albums, params: { group_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :links' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette 'controllers/api/discogs/groups/links/success' do
        get :links, params: { group_id: '28680' }
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette 'controllers/api/discogs/groups/links/wrong_id' do
        get :links, params: { group_id: random }
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
