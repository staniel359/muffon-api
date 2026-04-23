module Muffon
  module Formatter
    module User
      module VideoPlaylist
        module Videos
          class Video < Muffon::Formatter::Video::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                source_original_link
                source_name
                source_video_id
                title
                channel_title
                source_video_channel_id
                image_data
                creation_date
                description
                description_size
              ]
            end

            def data
              {
                **self_data,
                source: source_data,
                title:,
                channel: channel_data,
                image: image_data,
                publish_date: creation_date,
                description: description_computed
              }.compact
            end
          end
        end
      end
    end
  end
end
