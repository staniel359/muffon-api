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
                library: library_track_data,
                favorite_id:,
                player_id: track.player_id,
                title:,
                created: created_formatted
              }
            end

            def library_track
              @args[:library_track]
            end
          end
        end
      end
    end
  end
end
