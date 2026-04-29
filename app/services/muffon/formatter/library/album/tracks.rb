module Muffon
  module Formatter
    module Library
      module Album
        class Tracks < Muffon::Formatter::Library::Album::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              library_album_record
              tracks_data
            ]
          end

          def data
            {
              source: source_data,
              library: library_album_data,
              title:,
              artist: artist_data,
              artists:,
              **@args[:tracks_data]
            }.compact
          end
        end
      end
    end
  end
end
