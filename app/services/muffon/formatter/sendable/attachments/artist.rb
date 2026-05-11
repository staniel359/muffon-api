module Muffon
  module Formatter
    module Sendable
      module Attachments
        class Artist < Muffon::Formatter::Artist::Base
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
              name:,
              image: image_data,
              listeners_count:
            }.compact
          end

          def artist_record
            @args[:artist_record]
          end

          def image_data
            super&.slice(:small)
          end
        end
      end
    end
  end
end
