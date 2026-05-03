module Muffon
  module Formatter
    module Source
      module VideoPlaylist
        module Videos
          class Video < Muffon::Formatter::Source::Video::Base
            DESCRIPTION_SIZE = 'extrasmall'.freeze

            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                video_record
                description
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
                description: description_computed,
                views_count:
              }.compact
            end
          end
        end
      end
    end
  end
end
