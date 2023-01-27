module Muffon
  module Processor
    module Profile
      module Favorites
        module Video
          class Creator < Muffon::Processor::Profile::Favorites::Base
            include Muffon::Utils::Video

            private

            def primary_args
              super + [
                @args[:youtube_id]
              ]
            end

            def process_favorite
              favorite_video

              return favorite_video.errors_data if
                  favorite_video.errors?

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
                ).first_or_create
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
