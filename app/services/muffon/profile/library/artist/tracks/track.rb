module Muffon
  module Profile
    module Library
      module Artist
        class Tracks
          class Track < Muffon::Profile::Library::Artist::Tracks
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
                album: album_data,
                image: image_data,
                created: created_formatted
              }.compact
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
