module Muffon
  module Formatter
    module Source
      module Video
        class Info < Muffon::Formatter::Source::Video::Base
          DESCRIPTION_SIZE = 'medium'.freeze

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              video_record
              artist_data
              description
              tags
              tags_size
              likes_count
              dislikes_count
            ]
          end

          def data
            {
              **self_data,
              source: source_data,
              title:,
              channel: channel_data,
              image: image_data,
              artist: artist_data,
              publish_date:,
              duration:,
              description: description_computed,
              tags: tags_computed,
              views_count:,
              likes_count:,
              dislikes_count:,
              **with_more_data
            }.compact
          end
        end
      end
    end
  end
end
