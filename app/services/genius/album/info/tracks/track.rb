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
            {
              library_id: library_id,
              title: title,
              genius_id: genius_id,
              player_id: player_id,
              artist: artist_formatted,
              artists: artists
            }.compact
          end

          def track
            @track ||= @args.track
          end
        end
      end
    end
  end
end
