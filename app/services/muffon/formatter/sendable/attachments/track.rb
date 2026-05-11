module Muffon
  module Formatter
    module Sendable
      module Attachments
        class Track < Muffon::Formatter::Track::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_track_data
            ]
          end

          def data
            {
              source: source_data,
              title:,
              player_id:,
              artist: artist_data,
              artists:,
              album: album_data,
              image: image_data,
              audio: audio_data
            }.compact
          end

          def source_data
            @args[:raw_track_data]['source']
          end

          def title
            @args[:raw_track_data]['title']
          end

          def player_id
            @args[:raw_track_data]['player_id']
          end

          def artist_data
            @args[:raw_track_data]['artist']
          end

          def artists
            @args[:raw_track_data]['artists']
          end

          def album_data
            @args[:raw_track_data]['album']
          end

          def image_data
            @args[:raw_track_data]['image']&.slice('extrasmall')
          end

          def audio_data
            @args[:raw_track_data]['audio']
          end
        end
      end
    end
  end
end
