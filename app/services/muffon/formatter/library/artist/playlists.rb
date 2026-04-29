module Muffon
  module Formatter
    module Library
      module Artist
        class Playlists < Muffon::Formatter::Library::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              library_artist_record
              playlists_data
            ]
          end

          def data
            {
              source: source_data,
              library: library_artist_data,
              name:,
              **@args[:playlists_data]
            }.compact
          end
        end
      end
    end
  end
end
