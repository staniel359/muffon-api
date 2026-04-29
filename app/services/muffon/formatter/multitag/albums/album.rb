module Muffon
  module Formatter
    module Multitag
      module Albums
        class Album < Muffon::Formatter::Multitag::Album::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              album_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              title:,
              artist: artist_data,
              artists:,
              image: image_data,
              listeners_count:
            }.compact
          end
        end
      end
    end
  end
end
