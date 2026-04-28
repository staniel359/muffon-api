module Muffon
  module Formatter
    module Source
      module Track
        class Lyrics < Muffon::Formatter::Source::Track::Base
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
              lyrics
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              title:,
              artist: artist_data,
              artists:,
              lyrics:
            }.compact
          end
        end
      end
    end
  end
end
