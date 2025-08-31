module Muffon
  module Processor
    module Profile
      module Bookmarks
        module VideoChannel
          class Destroyer < Muffon::Processor::Profile::Bookmarks::Base
            private

            def required_args
              super + %i[
                bookmark_id
              ]
            end

            def process_bookmark
              bookmark_video_channel&.destroy

              { success: true }
            end

            def bookmark_video_channel
              if instance_variable_defined?(
                :@bookmark_video_channel
              )
                @bookmark_video_channel
              else
                @bookmark_video_channel =
                  profile
                  .bookmark_video_channels
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
