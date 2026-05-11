module Muffon
  module Formatter
    module Sendable
      module Attachments
        class VideoChannel < Muffon::Formatter::Source::VideoChannel::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              video_channel_record
            ]
          end

          def data
            {
              source: source_data,
              title:,
              image: image_data,
              videos_count:,
              subscribers_count:,
              publish_date:
            }.compact
          end
        end
      end
    end
  end
end
