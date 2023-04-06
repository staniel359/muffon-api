module YouTube
  module Search
    class Playlists
      class Playlist < YouTube::Search::Playlists
        include YouTube::Utils::Playlist

        def call
          data
        end

        private

        def data
          return if snippet.blank?

          self_data
            .merge(playlist_data)
        end

        def playlist_data
          {
            source: source_data,
            title:,
            channel: channel_data,
            image: image_data,
            publish_date:
          }
        end

        def playlist
          @args[:playlist]
        end

        def youtube_id
          playlist.dig(
            'id', 'playlistId'
          )
        end
      end
    end
  end
end
