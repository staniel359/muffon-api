module Muffon
  module Processor
    module Profile
      module Watched
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
              watched_video_record

              { watched_video: watched_video_data }
            end

            def watched_video_record
              @watched_video_record ||=
                profile_record
                .watched_videos
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

            def watched_video_data
              { id: watched_video_record.id }
            end
          end
        end
      end
    end
  end
end
