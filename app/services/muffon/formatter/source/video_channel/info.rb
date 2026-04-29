module Muffon
  module Formatter
    module Source
      module VideoChannel
        class Info < Muffon::Formatter::Source::VideoChannel::Base
          DESCRIPTION_SIZE = 'medium'.freeze

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              source_original_link
              source_name
              source_video_channel_id
              title
              image_data
              creation_date
              description
              views_count
              subscribers_count
              videos_count
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              title:,
              image: image_data,
              publish_date: creation_date,
              description: description_computed,
              views_count:,
              subscribers_count:,
              videos_count:,
              **with_more_data
            }.compact
          end
        end
      end
    end
  end
end
