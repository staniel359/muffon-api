module Muffon
  module Formatter
    module Recommendations
      module Artists
        class Artist < Muffon::Formatter::Recommendations::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              recommendation_artist_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              id:,
              name:,
              image: image_data,
              artists_count:,
              artists: library_artists_formatted,
              profiles_count:,
              listeners_count:
            }.compact
          end
        end
      end
    end
  end
end
