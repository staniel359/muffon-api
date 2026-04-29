module Muffon
  module Formatter
    module Bookmarks
      module VideoChannels
        class VideoChannel < Muffon::Formatter::Bookmarks::VideoChannel::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              bookmark_video_channel_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              id:,
              title:,
              image: image_data,
              created: creation_date
            }.compact
          end
        end
      end
    end
  end
end
