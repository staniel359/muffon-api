module Muffon
  module Formatter
    module Multitag
      module Artists
        class Artist < Muffon::Formatter::Multitag::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              artist_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              name:,
              image: image_data,
              listeners_count:
            }.compact
          end
        end
      end
    end
  end
end
