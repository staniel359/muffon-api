module Muffon
  module Formatter
    module Search
      module Tracks
        class Track < Muffon::Formatter::Track::Base
          def call
            check_args

            with_query_match(
              title:,
              query_title:,
              artist_name:,
              query_artist_name:
            ) do
              data
            end
          end

          private

          def required_args
            %i[
              source_original_link
              source_name
              source_track_id
              title
              artists
              image_data
              album_title
              source_album_id
              duration
              is_audio_present
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              player_id: player_source_id,
              title:,
              artist: artist_data,
              artists:,
              album: album_data,
              image: image_data,
              duration:,
              listeners_count:,
              audio: audio_data
            }.compact
          end
        end
      end
    end
  end
end
