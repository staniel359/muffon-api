module Muffon
  module Formatter
    module Sendable
      module Attachments
        class Video < Muffon::Formatter::Source::Video::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              video_record
            ]
          end

          def data
            {
              source: source_data,
              title:,
              channel: channel_data,
              image: image_data,
              views_count:,
              publish_date:
            }.compact
          end
        end
      end
    end
  end
end
