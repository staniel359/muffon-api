module Muffon
  module Formatter
    module Bookmarks
      module Tracks
        class Track < Muffon::Formatter::Bookmarks::Track::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              bookmark_track_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              id:,
              player_id: player_source_id,
              title:,
              artist: artist_data,
              artists:,
              album: album_data,
              image: image_data,
              created: creation_date,
              audio: audio_data
            }.compact
          end
        end
      end
    end
  end
end
