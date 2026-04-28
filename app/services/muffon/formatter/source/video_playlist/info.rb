module Muffon
  module Formatter
    module Source
      module VideoPlaylist
        class Info < Muffon::Formatter::Source::VideoPlaylist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              source_original_link
              source_name
              source_video_playlist_id
              title
              channel_title
              source_video_channel_id
              image_data
              creation_date
              description
              description_size
              videos_count
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
              description: description_computed,
              videos_count:,
              **with_more_data
            }.compact
          end
        end
      end
    end
  end
end
