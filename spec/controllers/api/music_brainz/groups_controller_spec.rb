RSpec.describe API::MusicBrainz::GroupsController do
  describe 'GET :info' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette(
        'controllers/api/musicbrainz/groups/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            group_id: 'b3c5541a-e1d0-354f-b6c8-565c37dde332'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette(
        'controllers/api/musicbrainz/groups/info/wrong_id'
      ) do
        get(
          :info,
          params: {
            **required_params,
            group_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :description' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette(
        'controllers/api/musicbrainz/groups/description/success'
      ) do
        get(
          :description,
          params: {
            **required_params,
            group_id: 'b3c5541a-e1d0-354f-b6c8-565c37dde332'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette(
        'controllers/api/musicbrainz/groups/description/wrong_id'
      ) do
        get(
          :description,
          params: {
            **required_params,
            group_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tags' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette(
        'controllers/api/musicbrainz/groups/tags/success'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            group_id: 'b3c5541a-e1d0-354f-b6c8-565c37dde332'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette(
        'controllers/api/musicbrainz/groups/tags/wrong_id'
      ) do
        get(
          :tags,
          params: {
            **required_params,
            group_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :albums' do
    it 'returns 200 if group_id present' do
      VCR.use_cassette(
        'controllers/api/musicbrainz/groups/albums/success'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            group_id: 'b3c5541a-e1d0-354f-b6c8-565c37dde332'
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 404 if wrong group_id' do
      VCR.use_cassette(
        'controllers/api/musicbrainz/groups/albums/wrong_id'
      ) do
        get(
          :albums,
          params: {
            **required_params,
            group_id: random_string
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
