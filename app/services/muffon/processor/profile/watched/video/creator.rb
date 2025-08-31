module Muffon
  module Processor
    module Profile
      module Watched
        module Video
          class Creator < Muffon::Processor::Profile::Watched::Base
            include Muffon::Utils::Video

            private

            def required_args
              super + %i[
                youtube_id
              ]
            end

            def process_watched
              watched_video

              {
                watched_video:
                  watched_video_data
              }
            end

            def watched_video
              @watched_video ||=
                profile
                .watched_videos
                .where(
                  video_id: find_video.id
                )
                .first_or_create!
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
