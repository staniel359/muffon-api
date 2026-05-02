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
          update_video_playlist_record!

          Muffon::Formatter::Source::Search::VideoPlaylists::VideoPlaylist.call(
            source_name:,
            video_playlist_record:,
            views_count:,
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
