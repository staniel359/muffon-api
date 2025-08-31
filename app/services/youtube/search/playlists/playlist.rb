module YouTube
  module Search
    class Playlists
      class Playlist < YouTube::Search::Playlists
        include YouTube::Utils::Playlist

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            playlist
          ]
        end

        def data
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
            'id',
            'playlistId'
          )
        end

        def image_data
          image_data_formatted(
            images:,
            model: 'search_playlist'
          )
        end
      end
    end
  end
end
