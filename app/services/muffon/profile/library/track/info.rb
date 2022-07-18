module Muffon
  module Profile
    module Library
      module Track
        class Info < Muffon::Profile::Library::Track::Base
          private

          def track_data
            muffon_data
              .merge(track_base_data)
              .merge(track_extra_data)
          end

          def track_base_data
            {
              library: library_track_data,
              player_id: track.player_id,
              title:,
              artist: artist_names_data,
              artists:
            }
          end

          def profile_id
            @args[:other_profile_id]
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
