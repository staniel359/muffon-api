module Muffon
  module Formatter
    module Source
      module VideoPlaylist
        class Info < Muffon::Formatter::Source::VideoPlaylist::Base
          DESCRIPTION_SIZE = 'medium'.freeze

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
              **self_data,
              source: source_data,
              title:,
              channel: channel_data,
              image: image_data,
              publish_date:,
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
