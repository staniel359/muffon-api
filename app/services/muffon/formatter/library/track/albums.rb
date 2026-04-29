module Muffon
  module Formatter
    module Library
      module Track
        class Albums < Muffon::Formatter::Library::Track::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              library_track_record
              albums_data
            ]
          end

          def data
            {
              source: source_data,
              library: library_track_data,
              player_id: player_source_id,
              title:,
              artist: artist_data,
              artists:,
              **@args[:albums_data]
            }.compact
          end
        end
      end
    end
  end
end
