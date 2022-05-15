module API
  module Muffon
    module Profiles
      module LastFM
        class ScrobblerController < API::Muffon::ProfilesController
          def play
            render_data_with_status
          end

          def save
            render_data_with_status
          end

          private

          def play_data
            ::Muffon::Profile::LastFM::Scrobbler::Player.call(
              params.slice(
                *%i[
                  profile_id token title
                  artist_name album_title duration
                ]
              )
            )
          end

          def save_data
            ::Muffon::Profile::LastFM::Scrobbler::Saver.call(
              params.slice(
                *%i[
                  profile_id token title
                  artist_name album_title duration
                ]
              )
            )
          end
        end
      end
    end
  end
end
