module Muffon
  module Formatter
    module Source
      module Search
        module Videos
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
                **self_data,
                source: source_data,
                title:,
                channel: channel_data,
                image: image_data,
                publish_date:,
                duration:,
                views_count:
              }.compact
            end
          end
        end
      end
    end
  end
end
