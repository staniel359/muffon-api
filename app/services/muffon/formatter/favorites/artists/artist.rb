module Muffon
  module Formatter
    module Favorites
      module Artists
        class Artist < Muffon::Formatter::Favorites::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              favorite_artist_record
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
