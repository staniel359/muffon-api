module Muffon
  module Formatter
    module Library
      module Artist
        class Info < Muffon::Formatter::Library::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              library_artist_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              library: library_artist_data,
              name:,
              image: image_data,
              tracks_count:,
              albums_count:,
              playlists_count:,
              created: creation_date
            }.compact
          end
        end
      end
    end
  end
end
