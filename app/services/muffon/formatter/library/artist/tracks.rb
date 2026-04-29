module Muffon
  module Formatter
    module Library
      module Artist
        class Tracks < Muffon::Formatter::Library::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              library_artist_record
              tracks_data
            ]
          end

          def data
            {
              source: source_data,
              library: library_artist_data,
              name:,
              **@args[:tracks_data]
            }.compact
          end
        end
      end
    end
  end
end
