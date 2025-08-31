module Muffon
  module Processor
    module Profile
      module Favorites
        module Video
          class Creator < Muffon::Processor::Profile::Favorites::Base
            include Muffon::Utils::Video

            private

            def required_args
              super + %i[
                youtube_id
              ]
            end

            def process_favorite
              favorite_video

              {
                favorite_video:
                  favorite_video_data
              }
            end

            def favorite_video
              @favorite_video ||=
                profile
                .favorite_videos
                .where(
                  video_id: find_video.id
                )
                .first_or_create!
            end

            def favorite_video_data
              { id: favorite_video.id }
            end
          end
        end
      end
    end
  end
end
