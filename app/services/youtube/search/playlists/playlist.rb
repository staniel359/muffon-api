module YouTube
  module Search
    class Playlists
      class Playlist < YouTube::Base
        include YouTube::Mixins::VideoPlaylist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_video_playlist_data
          ]
        end

        def data
          update_video_playlist_record!

          Muffon::Formatter::Source::Search::VideoPlaylists::VideoPlaylist.call(
            video_playlist_record:,
            **self_args
          )
        end

        def raw_video_playlist_data
          @args[:raw_video_playlist_data]
        end

        def youtube_id
          raw_video_playlist_data.dig(
            'id',
            'playlistId'
          )
        end
      end
    end
  end
end
