module LastFM
  module User
    class Playlists
      class Playlist < LastFM::User::Playlists
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
          {
            source: source_data,
            title:,
            tracks_count:
          }.compact
        end

        def source_data
          {
            name: source_name,
            id: lastfm_id,
            links: source_links_data
          }
        end

        def lastfm_id
          raw_lastfm_id
            .match(%r{/playlists/(.+)})[1]
            .to_i
        end

        def raw_lastfm_id
          playlist
            .css('.playlisting-playlists-item-name')[0]
            .css('.link-block-target')[0]['href']
            .match(%r{(/user/.+)})[0]
        end

        def playlist
          @args[:playlist]
        end

        def original_link
          "https://www.last.fm#{raw_lastfm_id}"
        end

        def title
          playlist
            .css('.playlisting-playlists-item-name')[0]
            .text
            .strip
        end

        def tracks_count
          if raw_tracks_count.present?
            raw_tracks_count
              .text
              .strip
              .scan(/\d+/)
              .join
              .to_i
          else
            0
          end
        end

        def raw_tracks_count
          playlist.css(
            '.playlisting-playlists-item-entry-count'
          )[0]
        end
      end
    end
  end
end
