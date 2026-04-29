module Muffon
  module Formatter
    module Library
      module Album
        class Info < Muffon::Formatter::Library::Album::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              library_album_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              library: library_album_data,
              title:,
              artist: artist_data,
              artists:,
              image: image_data,
              tracks_count:,
              playlists_count:,
              created: creation_date
            }.compact
          end
        end
      end
    end
  end
end
