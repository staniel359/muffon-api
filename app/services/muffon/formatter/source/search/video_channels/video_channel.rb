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
                video_channel_record
              ]
            end

            def data
              {
                **self_data,
                source: source_data,
                title:,
                image: image_data,
                publish_date:
              }.compact
            end
          end
        end
      end
    end
  end
end
