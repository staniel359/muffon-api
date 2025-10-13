module YouTubeMusic
  module Search
    class Playlists
      class Playlist < YouTubeMusic::Search::Playlists
        include YouTubeMusic::Utils::Playlist

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
            views_count:
          }.compact
        end

        def playlist
          @args[:playlist]
        end

        def views_count
          human_number_to_number(
            raw_views_count
          )
        end
      end
    end
  end
end
