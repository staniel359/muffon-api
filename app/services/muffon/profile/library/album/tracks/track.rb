module Muffon
  module Profile
    module Library
      module Album
        class Tracks
          class Track < Muffon::Profile::Library::Album::Tracks
            include Muffon::Utils::Library::Track

            def call
              data
            end

            private

            def data
              {
                id: profile_track.id,
                favorite_id:,
                player_id: track.player_id,
                title: track.title,
                created: created_formatted
              }
            end

            def profile_track
              @args[:profile_track]
            end
          end
        end
      end
    end
  end
end
