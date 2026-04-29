module Muffon
  module Formatter
    module Bookmarks
      module VideoPlaylist
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::VideoPlaylist

          private

          def video_playlist_record
            @video_playlist_record ||=
              bookmark_video_playlist_record.video_playlist
          end

          def bookmark_video_playlist_record
            @args[:bookmark_video_playlist_record]
          end

          def source_data
            video_playlist_record.source_data
          end

          def id
            bookmark_video_playlist_record.id
          end

          def title
            video_playlist_record.title
          end

          def video_channel_data
            video_playlist_record.video_channel_data
          end

          def image_data
            video_playlist_record.image_data
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            bookmark_video_playlist_record.created_at
          end
        end
      end
    end
  end
end
