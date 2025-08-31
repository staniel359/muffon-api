RSpec.describe API::Spotify::UsersController do
  describe 'GET :info' do
    it 'returns 200 if user exists' do
      VCR.use_cassette(
        'controllers/api/spotify/users/info/success'
      ) do
        get(
          :info,
          params: {
            **required_params,
            access_token: 'BQDXlski5Nk80PjNwaSTw-Qr_gz0Eche_x0o7gnXRR5CoX1DQqIKYRhKnmJru0RMmzYVB76yvwuI9AlwzRh1ePUoNZ4zVylJfZ5p0U8XafJoAp1aGBO2POMSyVbQoZHM7-gcSike96ET6NP3o-5r_doPt0PtRoH2kPmIeP0kms01KQY6IqmCJ1z-jpQGI8cx_qSQJcNVEgA2kRoDUB3iZavdOqy8y66fnhpu',
            profile_id: 1
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no access_token' do
      get(
        :info,
        params: {
          **required_params,
          access_token: '',
          profile_id: 1
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong access_token' do
      VCR.use_cassette(
        'controllers/api/spotify/users/info/wrong_token'
      ) do
        get(
          :info,
          params: {
            **required_params,
            access_token: random_string,
            profile_id: 1
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :tracks' do
    it 'returns 200 if user exists' do
      VCR.use_cassette(
        'controllers/api/spotify/users/tracks/success'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            access_token: 'BQARj7LFWQvottdy5lbiae9ICJG19n1i9M9Opo1zAp-zs0gHC20VotW1O-wkfS-59h1IysJhQK7Qw4uuHriCMnk0BId5YSEMj1EBzh1Qn1_y_KietaRk4122vXV0QMvj8sT9zeNbh8W_ab5h5_orMnVJ8YzxcJE9Sppwro9Y3Q-9TzdDq5HZoCpfPNHa2qfWPv4hMl23KunTey8aZbAkV30egA',
            profile_id: 1,
            page: 2,
            limit: 5
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no access_token' do
      get(
        :tracks,
        params: {
          **required_params,
          access_token: '',
          profile_id: 1
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong access_token' do
      VCR.use_cassette(
        'controllers/api/spotify/users/tracks/wrong_token'
      ) do
        get(
          :tracks,
          params: {
            **required_params,
            access_token: random_string,
            profile_id: 1
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET :playlists' do
    it 'returns 200 if user exists' do
      VCR.use_cassette(
        'controllers/api/spotify/users/playlists/success'
      ) do
        get(
          :playlists,
          params: {
            **required_params,
            access_token: 'BQDF0G5HXoWAjv6TcTR0iUt_yHwu8b2ANZ-Nowu1KaTS1POUnclTr0yCycfImQVcPRmFq5-_XLn9U1FXUzbOk7HlKAfqGj6ztDlgG2Ym990a1RgCs19aCYHr08IT2REZo7NT2vI0LHB4cONwMaroRP-H3Ke4lqpPW5TxlQq42leexbi4kUQr-KDe0ADtn4jJ7FeldpSuavYb_IrCx4heRQBjWFYQzsyOPVLv',
            profile_id: 1,
            page: 2,
            limit: 5
          }
        )
      end

      expect(response).to have_http_status(:ok)
    end

    it 'returns 400 if no access_token' do
      get(
        :playlists,
        params: {
          **required_params,
          access_token: '',
          profile_id: 1
        }
      )

      expect(response).to have_http_status(:bad_request)
    end

    it 'returns 404 if wrong access_token' do
      VCR.use_cassette(
        'controllers/api/spotify/users/playlists/wrong_token'
      ) do
        get(
          :playlists,
          params: {
            **required_params,
            access_token: random_string,
            profile_id: 1
          }
        )
      end

      expect(response).to have_http_status(:not_found)
    end
  end
end
