module Genius
  module Album
    class Info
      class Tracks
        class Track < Genius::Album::Info::Tracks
          include Genius::Utils::Track

          def call
            data
          end

          private

          def data
            muffon_data.merge(track_data)
          end

          def track_data
            {
              id: id,
              player_id: player_id,
              source_id: SOURCE_ID,
              genius_id: genius_id,
              title: title,
              artist: artist_formatted,
              artists: artists
            }
          end

          def track
            @track ||= @args.track
          end
        end
      end
    end
  end
end
