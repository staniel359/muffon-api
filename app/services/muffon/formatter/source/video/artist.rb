module Muffon
  module Formatter
    module Source
      module Video
        class Artist < Muffon::Formatter::Source::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              channel_title
            ]
          end

          def data
            return if name.blank?

            {
              **self_data,
              name:,
              image: artist_record.image_data,
              listeners_count:
            }.compact
          end

          def name
            @args[:channel_title]
              .match(/(.+) - Topic/)
              .try(:[], 1)
          end
        end
      end
    end
  end
end
