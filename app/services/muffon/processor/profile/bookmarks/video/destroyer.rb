module Muffon
  module Processor
    module Profile
      module Bookmarks
        module Video
          class Destroyer < Muffon::Processor::Profile::Bookmarks::Base
            private

            def primary_args
              super + [
                @args[:bookmark_id]
              ]
            end

            def process_bookmark
              bookmark_video&.destroy

              { success: true }
            end

            def bookmark_video
              if instance_variable_defined?(
                :@bookmark_video
              )
                @bookmark_video
              else
                @bookmark_video =
                  profile
                  .bookmark_videos
                  .find_by(
                    id: @args[:bookmark_id]
                  )
              end
            end
          end
        end
      end
    end
  end
end
