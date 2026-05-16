module Muffon
  module Profile
    module Bookmarks
      class Base < Muffon::Profile::Base
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def required_args
          [
            *super,
            :token
          ]
        end

        def forbidden?
          !valid_profile?
        end

        def profile_data
          {
            **super,
            bookmarks: bookmarks_data
          }
        end

        def artists
          @artists ||= profile_record.bookmark_artists
        end

        def albums
          @albums ||= profile_record.bookmark_albums
        end

        def tracks
          @tracks ||= profile_record.bookmark_tracks
        end

        def videos
          @videos ||= profile_record.bookmark_videos
        end

        def video_channels
          @video_channels ||=
            profile_record.bookmark_video_channels
        end

        def video_playlists
          @video_playlists ||=
            profile_record.bookmark_video_playlists
        end
      end
    end
  end
end
