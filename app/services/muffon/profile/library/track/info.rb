module Muffon
  module Profile
    module Library
      module Track
        class Info < Muffon::Profile::Library::Track::Base
          private

          def track_data
            track_base_data
              .merge(track_extra_data)
          end

          def track_base_data
            {
              id: library_track.id,
              favorite_id:,
              player_id: track.player_id,
              title: track.title,
              artist: artist_data
            }
          end

          def track_extra_data
            {
              album: album_data,
              image: library_album&.image_data,
              created: created_formatted
            }.compact
          end
        end
      end
    end
  end
end
