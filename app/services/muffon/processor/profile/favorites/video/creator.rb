module Muffon
  module Processor
    module Profile
      module Favorites
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
              favorite_video_record

              { favorite_video: favorite_video_data }
            end

            def favorite_video_record
              @favorite_video_record ||=
                profile_record
                .favorite_videos
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

            def favorite_video_data
              { id: favorite_video_record.id }
            end
          end
        end
      end
    end
  end
end
