module Muffon
  module Formatter
    module Source
      module VideoPlaylists
        class VideoPlaylist < Muffon::Formatter::Source::VideoPlaylist::Base
          DESCRIPTION_SIZE = 'extrasmall'.freeze

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
              publish_date:,
              description: description_computed,
              videos_count:
            }.compact
          end
        end
      end
    end
  end
end
