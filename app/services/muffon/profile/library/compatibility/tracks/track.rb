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
              self_data
                .merge(track_base_data)
                .merge(track_extra_data)
            end

            def track_base_data
              {
                source: source_data,
                library: library_track_data,
                player_id: find_track.player_id,
                title:,
                artist: artist_names_data,
                artists:
              }.compact
            end

            def library_track
              @args[:library_track]
            end

            def track_extra_data
              {
                album: album_data,
                image: image_data,
                created: created_formatted
              }.compact
            end
          end
        end
      end
    end
  end
end
