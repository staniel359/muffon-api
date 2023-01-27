module Muffon
  module Processor
    module Profile
      module Watched
        module Video
          class Creator < Muffon::Processor::Profile::Watched::Base
            include Muffon::Utils::Video

            private

            def primary_args
              super + [
                @args[:youtube_id]
              ]
            end

            def process_watched
              watched_video

              return watched_video.errors_data if
                  watched_video.errors?

              { watched_video: watched_video_data }
            end

            def watched_video
              @watched_video ||=
                profile
                .watched_videos
                .where(
                  video_id: find_video.id
                ).first_or_create
            end

            def watched_video_data
              { id: watched_video.id }
            end
          end
        end
      end
    end
  end
end
