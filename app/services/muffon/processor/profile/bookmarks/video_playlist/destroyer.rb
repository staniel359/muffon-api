module Muffon
  module Processor
    module Profile
      module Bookmarks
        module VideoPlaylist
          class Destroyer < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :bookmark_id
              ]
            end

            def data
              bookmark_video_playlist_record.destroy!

              { success: true }
            end

            def bookmark_video_playlist_record
              profile_record
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
