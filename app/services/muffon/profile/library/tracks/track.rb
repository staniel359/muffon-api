module Muffon
  module Profile
    module Library
      class Tracks
        class Track < Muffon::Profile::Library::Tracks
          include Muffon::Utils::Library::Track

          def call
            data
          end

          private

          def data
            track_base_data
              .merge(track_extra_data)
          end

          def track_base_data
            {
              id: library_track.id,
              favorite_id:,
              playlist_track_id:,
              player_id: track.player_id,
              title: track.title,
              artist: artist_data
            }.compact
          end

          def library_track
            @args[:library_track]
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
