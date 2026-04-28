module Muffon
  module Formatter
    module Source
      module VideoChannel
        class Videos < Muffon::Formatter::Source::VideoChannel::Base
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
              prev_page
              next_page
              videos
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              title:,
              prev_page:,
              next_page:,
              videos:,
              **with_more_data
            }.compact
          end
        end
      end
    end
  end
end
