module Muffon
  module Formatter
    module Favorites
      module Albums
        class Album < Muffon::Formatter::Favorites::Album::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              favorite_album_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              id:,
              title:,
              artist: artist_data,
              artists:,
              image: image_data,
              created: creation_date
            }.compact
          end
        end
      end
    end
  end
end
