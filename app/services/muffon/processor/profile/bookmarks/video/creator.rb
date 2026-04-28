module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Video
          class Creator < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :youtube_id
              ]
            end

            def data
              bookmark_video_record

              { bookmark_video: bookmark_video_data }
            end

            def bookmark_video_record
              @bookmark_video_record ||=
                profile_record
                .bookmark_videos
                .where(
                  video_id: video_record.id
                )
                .first_or_create!
            end

            def video_record
              ::Video.find_by(
                youtube_id: @args[:youtube_id]
              )
            end

            def bookmark_video_data
              { id: bookmark_video_record.id }
            end
          end
        end
      end
    end
  end
end
