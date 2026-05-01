module YouTubeMusic
  module Search
    class Playlists
      class Playlist < YouTubeMusic::Base
        include YouTubeMusic::Mixins::VideoPlaylist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_playlist_data
          ]
        end

        def data
          Muffon::Formatter::Source::Search::VideoPlaylists::VideoPlaylist.call(
            source_original_link:,
            source_name:,
            source_video_playlist_id: youtube_id,
            title:,
            channel_title:,
            source_video_channel_id: channel_youtube_id,
            image_data:,
            views_count:,
            videos_count:,
            creation_date: nil,
            **self_args
          )
        end

        def raw_playlist_data
          @args[:raw_playlist_data]
        end
      end
    end
  end
end
