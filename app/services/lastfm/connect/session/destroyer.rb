module LastFM
  module Connect
    module Session
      class Destroyer < LastFM::Connect::Session::Base
        private

        def process_profile
          disconnect_profile

          { success: true }
        end

        def disconnect_profile
          profile.update(
            lastfm_nickname: nil,
            lastfm_session_key: nil
          )
        end
      end
    end
  end
end
