module Muffon
  module Formatter
    module Sendable
      module Attachments
        class VideoPlaylist < Muffon::Formatter::Source::VideoPlaylist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              video_playlist_record
            ]
          end

          def data
            {
              source: source_data,
              title:,
              channel: channel_data,
              description:,
              image: image_data,
              videos_count:,
              publish_date:
            }.compact
          end
        end
      end
    end
  end
end
