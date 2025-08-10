module Muffon
  module Processor
    module Profile
      module Bookmarks
        module VideoPlaylist
          class Destroyer < Muffon::Processor::Profile::Bookmarks::Base
            private

            def primary_args
              super + [
                @args[:bookmark_id]
              ]
            end

            def process_bookmark
              bookmark_video_playlist&.destroy

              { success: true }
            end

            def bookmark_video_playlist
              if instance_variable_defined?(
                :@bookmark_video_playlist
              )
                @bookmark_video_playlist
              else
                @bookmark_video_playlist =
                  profile
                  .bookmark_video_playlists
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
