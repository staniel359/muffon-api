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

            def not_found?
              super || bookmark_video_playlist_record.blank?
            end

            def bookmark_video_playlist_record
              if defined?(@bookmark_video_playlist_record)
                @bookmark_video_playlist_record
              else
                @bookmark_video_playlist_record =
                  profile_record
                  .bookmark_video_playlists
                  .find_by(
                    id: @args[:bookmark_id]
                  )
              end
            end

            def data
              bookmark_video_playlist_record.destroy!

              { success: true }
            end
          end
        end
      end
    end
  end
end
