module Muffon
  module Formatter
    module Source
      module Search
        module VideoChannels
          class VideoChannel < Muffon::Formatter::Source::VideoChannel::Base
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
              ]
            end

            def data
              {
                **self_data,
                source: source_data,
                title:,
                image: image_data,
                publish_date: creation_date
              }.compact
            end
          end
        end
      end
    end
  end
end
