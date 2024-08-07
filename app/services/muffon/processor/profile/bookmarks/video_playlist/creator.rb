module Muffon
  module Processor
    module Profile
      module Bookmarks
        module VideoPlaylist
          class Creator < Muffon::Processor::Profile::Bookmarks::Base
            include Muffon::Utils::VideoPlaylist

            private

            def primary_args
              super + [
                @args[:youtube_id]
              ]
            end

            def process_bookmark
              bookmark_video_playlist

              return bookmark_video_playlist.errors_data if
                  bookmark_video_playlist.errors?

              {
                bookmark_video_playlist:
                  bookmark_video_playlist_data
              }
            end

            def bookmark_video_playlist
              @bookmark_video_playlist ||=
                profile
                .bookmark_video_playlists
                .where(
                  video_playlist_id:
                    find_video_playlist.id
                ).first_or_create
            end

            def bookmark_video_playlist_data
              { id: bookmark_video_playlist.id }
            end
          end
        end
      end
    end
  end
end
