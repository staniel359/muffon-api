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
            raw_playlist_data
          ]
        end

        def data
          Muffon::Formatter::User::Playlists::Playlist.call(
            source_original_link:,
            source_name:,
            source_playlist_id: lastfm_id,
            title:,
            image_data: nil,
            description: nil,
            description_size: nil,
            tracks_count:,
            tracks: nil
          )
        end

        def lastfm_id
          raw_lastfm_id
            .match(%r{/playlists/(.+)})[1]
            .to_i
        end

        def raw_lastfm_id
          raw_playlist_data
            .css('.playlisting-playlists-item-name')[0]
            .css('.link-block-target')[0]['href']
            .match(%r{(/user/.+)})[0]
        end

        def raw_playlist_data
          @args[:raw_playlist_data]
        end

        def source_original_link
          "https://www.last.fm#{raw_lastfm_id}"
        end

        def title
          raw_playlist_data
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
          raw_playlist_data.css(
            '.playlisting-playlists-item-entry-count'
          )[0]
        end
      end
    end
  end
end
