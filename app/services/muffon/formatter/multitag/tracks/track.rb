module Muffon
  module Formatter
    module Multitag
      module Tracks
        class Track < Muffon::Formatter::Track::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              track_record
              source_original_link
              source_name
              source_track_id
              title
              artists
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
              listeners_count:
            }.compact
          end

          def track_record
            @args[:track_record]
          end
        end
      end
    end
  end
end
