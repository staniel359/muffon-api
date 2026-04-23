module Muffon
  module Formatter
    module AlbumGroup
      module Tracks
        class Track < Muffon::Formatter::Track::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              source_original_link
              source_name
              source_track_id
              title
              artists
              album_data
              image_data
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

          def album_data
            @args[:album_data]
          end
        end
      end
    end
  end
end
