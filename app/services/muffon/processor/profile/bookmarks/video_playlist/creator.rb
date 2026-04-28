module Muffon
  module Processor
    module Profile
      module Bookmarks
        module VideoPlaylist
          class Creator < Muffon::Processor::Profile::Base
            private

            def required_args
              [
                *super,
                :youtube_id
              ]
            end

            def data
              bookmark_video_playlist_record

              {
                bookmark_video_playlist:
                  bookmark_video_playlist_data
              }
            end

            def bookmark_video_playlist_record
              @bookmark_video_playlist_record ||=
                profile_record
                .bookmark_video_playlists
                .where(
                  video_playlist_id:
                    video_playlist_record.id
                )
                .first_or_create!
            end

            def video_playlist_record
              ::VideoPlaylist.find_by(
                youtube_id: @args[:youtube_id]
              )
            end

            def bookmark_video_playlist_data
              { id: bookmark_video_playlist_record.id }
            end
          end
        end
      end
    end
  end
end
