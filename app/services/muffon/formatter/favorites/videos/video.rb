module Muffon
  module Formatter
    module Favorites
      module Videos
        class Video < Muffon::Formatter::Favorites::Video::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              favorite_video_record
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              id:,
              title:,
              channel: video_channel_data,
              image: image_data,
              created: creation_date
            }.compact
          end
        end
      end
    end
  end
end
