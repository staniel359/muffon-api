module Muffon
  module Profile
    module Library
      module Compatibility
        class Tracks
          class Track < Muffon::Profile::Library::Compatibility::Tracks
            include Muffon::Utils::Library::Track

            def call
              data
            end

            private

            def data
              {
                library: library_track_data,
                player_id: find_track.player_id,
                title:,
                artist: artist_names_data,
                artists:,
                album: album_data,
                image: image_data
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
