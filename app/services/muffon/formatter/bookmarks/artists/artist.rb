module Muffon
  module Formatter
    module Bookmarks
      module Artists
        class Artist < Muffon::Formatter::Bookmarks::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              bookmark_artist_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              id:,
              name:,
              image: image_data,
              created: creation_date
            }.compact
          end
        end
      end
    end
  end
end
