module Muffon
  module Profile
    module Bookmarks
      class VideoPlaylists
        class VideoPlaylist < YouTube::Base
          include YouTube::Utils::Playlist

          def call
            data
          end

          private

          def data
            self_data
              .merge(bookmark_video_playlist_data)
          end

          def bookmark_video_playlist_data
            {
              source: source_data,
              id: bookmark_video_playlist.id,
              title:,
              channel: channel_data,
              image: image_data,
              videos_count:,
              publish_date:,
              created: created_formatted
            }.compact
          end

          def youtube_id
            video_playlist.youtube_id
          end

          def video_playlist
            @video_playlist ||=
              bookmark_video_playlist.video_playlist
          end

          def bookmark_video_playlist
            @args[:bookmark_video_playlist]
          end

          def title
            video_playlist.title
          end

          def channel_youtube_id
            video_playlist.channel_youtube_id
          end

          def channel_title
            video_playlist.channel_title
          end

          def image
            video_playlist.image_url
          end

          def videos_count
            video_playlist.videos_count
          end

          def raw_publish_date
            video_playlist.publish_date
          end

          def created_formatted
            datetime_formatted(
              bookmark_video_playlist.created_at
            )
          end
        end
      end
    end
  end
end
