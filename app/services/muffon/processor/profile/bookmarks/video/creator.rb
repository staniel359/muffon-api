module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Video
          class Creator < Muffon::Processor::Profile::Bookmarks::Base
            include Muffon::Utils::Video

            private

            def primary_args
              super + [
                @args[:youtube_id]
              ]
            end

            def process_bookmark
              bookmark_video

              return bookmark_video.errors_data if
                  bookmark_video.errors?

              {
                bookmark_video:
                  bookmark_video_data
              }
            end

            def bookmark_video
              @bookmark_video ||=
                profile
                .bookmark_videos
                .where(
                  video_id: find_video.id
                ).first_or_create
            end

            def bookmark_video_data
              { id: bookmark_video.id }
            end
          end
        end
      end
    end
  end
end
